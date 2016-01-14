//
//  AlarmManager.swift
//  Alarm
//
//  Created by ShinSheungmin on 12/20/15.
//  Copyright © 2015 HappyEngineer. All rights reserved.
//

import Foundation


class AlarmItem: NSObject, NSCoding{
    var title : String
    var active : Bool
    var date : NSDate
    
    init (title: String!, active: Bool, date: NSDate) {
        self.title = title
        self.active = active
        self.date = date
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.title = aDecoder.decodeObjectForKey("Title") as! String
        self.active = aDecoder.decodeObjectForKey("Active") as! Bool
        self.date = aDecoder.decodeObjectForKey("Active") as! NSDate
        
        super.init()
    }
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.title, forKey: "Title")
        aCoder.encodeObject(self.active, forKey: "Active")
        aCoder.encodeObject(self.date, forKey: "Date")
    }
}

class AlarmManager {
    static let sharedInstance: AlarmManager = {
        return AlarmManager()
    }()
    
    var alarmItems = [AlarmItem]() {
        didSet {
            totalAlarmItems = alarmItems.count + 1
        }
    }
    var totalAlarmItems = 1
    let numberOfSectionsInMainCollectionView = 1
    let plistName = "AlarmList.plist"
}

extension AlarmManager {

    func createPlist() -> Bool {

        let documentDirectory = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0]
        let fullPathName = documentDirectory.stringByAppendingString(plistName)
        let fileManager = NSFileManager.defaultManager()

        if !fileManager.fileExistsAtPath(fullPathName) {
            fileManager.createFileAtPath(fullPathName, contents: nil, attributes: nil)
            if fileManager.fileExistsAtPath(fullPathName) {
                return true
            }
            return false
        } else {
            return true
        }
    }
    
    func deletePlist() -> Bool {
        let documentDirectory = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0]
        let fullPathName = documentDirectory.stringByAppendingString(plistName)
        let fileManager = NSFileManager.defaultManager()
        
        if fileManager.fileExistsAtPath(fullPathName) {
            do {
                try fileManager.removeItemAtPath(fullPathName)
            } catch {
                return false
            }

            if fileManager.fileExistsAtPath(fullPathName) {
                return false
            }
            return true
        } else {
            return true
        }
    }
    
    func addPlistItem (title: String, active: Bool, date: NSDate) -> Bool {
        let documentDirectory = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as NSString
        let fullPathName = documentDirectory.stringByAppendingString(plistName)
        let fileManager = NSFileManager.defaultManager()
        
        if fileManager.fileExistsAtPath(fullPathName) {
            alarmItems.append(AlarmItem(title: title, active: active, date: date))
            return NSKeyedArchiver.archiveRootObject(alarmItems, toFile: fullPathName)
        } else {
            return false
        }

    }
}