//
//  AlarmManager.swift
//  Alarm
//
//  Created by ShinSheungmin on 12/20/15.
//  Copyright © 2015 HappyEngineer. All rights reserved.
//

import Foundation

struct AlarmItem {
    var description: String?
    var turnOn: Bool
    var deadLine: NSDate
    
    init(description: String?, turnOn: Bool, deadLine: NSDate) {
        self.description = description
        self.turnOn = turnOn
        self.deadLine = deadLine
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
}

extension AlarmManager {
    func createPListFile() -> Bool {
        let plistFile = "alarmPList.plist"
        
        if let documentsDirectory = NSSearchPathForDirectoriesInDomains(.DocumentationDirectory, .UserDomainMask, true).first {
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
    
    func deletePListFile() -> Bool {
        let plistFile = "alarmPList.plist"

        if let documentsDirectory = NSSearchPathForDirectoriesInDomains(.DocumentationDirectory, .UserDomainMask, true).first {
            let plistPath = documentsDirectory.stringByAppendingString(plistFile)
            let fileManager = NSFileManager.defaultManager()
            
            if fileManager.fileExistsAtPath(plistPath) {
                fileManager.delete(nil)
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
        let plistFile = "alarmPList.plist"
        
        if let documentsDirectory = NSSearchPathForDirectoriesInDomains(.DocumentationDirectory, .UserDomainMask, true).first {
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