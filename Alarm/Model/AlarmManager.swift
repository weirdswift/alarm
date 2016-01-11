//
//  AlarmManager.swift
//  Alarm
//
//  Created by ShinSheungmin on 12/20/15.
//  Copyright © 2015 HappyEngineer. All rights reserved.
//

import Foundation

class AlarmItem: NSCoder {
    var title: String?
    var turnOn: Bool
    var deadLine: NSDate
    
    init(title: String?, turnOn: Bool, deadLine: NSDate) {
        self.title = title
        self.turnOn = turnOn
        self.deadLine = deadLine
    }
    
    func encodeWithCoder(aCoder: NSCoder!) {
        aCoder.encodeObject(title, forKey: "title")
        aCoder.encodeObject(turnOn, forKey: "turnOn")
        aCoder.encodeObject(deadLine, forKey: "deadLine")
    }
    
    required init(coder aDecoder: NSCoder!) {
        self.title = aDecoder.decodeObjectForKey("title") as? String
        self.turnOn = aDecoder.decodeObjectForKey("turnOn") as! Bool
        self.deadLine = aDecoder.decodeObjectForKey("deadLine") as! NSDate
        
        super.init()
    }
}

class AlarmManager {
    static let sharedInstance: AlarmManager = {
        return AlarmManager()
    }()
    
    private init() {
        print("AlarmManager sharedInstance init called.")
    }
    
    var alarmItems = [AlarmItem]() {
        didSet {
            totalAlarmItems = alarmItems.count + 1
        }
    }
    var totalAlarmItems = 1
    let numberOfSectionsInMainCollectionView = 1
    let plistFile = "alarmPList.plist"
}

extension AlarmManager {
    func createPListFile() -> Bool {
        if let documentsDirectory = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first as NSString? {
            let plistPath = documentsDirectory.stringByAppendingPathComponent(plistFile)
            let fileManager = NSFileManager.defaultManager()
            
            if fileManager.fileExistsAtPath(plistPath) {
                return true
            } else {
                let alarmDatas = [AlarmItem]()
                NSKeyedArchiver.archivedDataWithRootObject(alarmDatas).writeToFile(plistPath, atomically: true)
                if fileManager.fileExistsAtPath(plistPath) {
                    return true
                }
                return false
            }
        }
        return false
    }
    
    func deletePListFile() -> Bool {
        if let documentsDirectory = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first as NSString? {
            let plistPath = documentsDirectory.stringByAppendingPathComponent(plistFile)
            let fileManager = NSFileManager.defaultManager()
            
            if fileManager.fileExistsAtPath(plistPath) {
                do {
                    try fileManager.removeItemAtPath(plistPath)
                } catch {
                    print("PList file can't removed")
                }
                if !fileManager.fileExistsAtPath(plistPath) {
                    return true
                } else {
                    return false
                }
            } else {
                return true
            }
        }
        return false
    }
    
    func checkPListFile() -> Bool {
        if let documentsDirectory = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first as NSString? {
            let plistPath = documentsDirectory.stringByAppendingString(plistFile)
            let fileManager = NSFileManager.defaultManager()
            
            if fileManager.fileExistsAtPath(plistPath) {
                return true
            } else {
                return false
            }
        }
        
        return false
    }
}