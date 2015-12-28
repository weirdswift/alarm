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
    
    var alarmItems = [AlarmItem]() {
        didSet {
            totalAlarmItems = alarmItems.count + 1
        }
    }
    var totalAlarmItems = 1
    let numberOfSectionsInMainCollectionView = 1
}