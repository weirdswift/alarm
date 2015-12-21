//
//  AlarmManager.swift
//  Alarm
//
//  Created by ShinSheungmin on 12/20/15.
//  Copyright © 2015 HappyEngineer. All rights reserved.
//

import Foundation

struct AlarmItem {
    
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