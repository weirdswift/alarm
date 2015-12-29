//
//  AlarmManagerTests.swift
//  Alarm
//
//  Created by ShinSheungmin on 12/20/15.
//  Copyright © 2015 HappyEngineer. All rights reserved.
//

import XCTest

class AlarmManagerTests: XCTestCase {
    let alarmManagerSharedInstance = AlarmManager.sharedInstance
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        
        alarmManagerSharedInstance.alarmItems.removeAll()
    }
    
    func testInstanceAlarmManagerIsNotNil() {
        XCTAssertNotNil(alarmManagerSharedInstance, "AlarmManager is nil")
    }
    
    func testNumberOfSectionsInMainCollectionView() {
        let numberOfSectionsInMainViewController_is_One = 1
        let numberOfSections = alarmManagerSharedInstance.numberOfSectionsInMainCollectionView
        XCTAssertEqual(numberOfSections, numberOfSectionsInMainViewController_is_One, "MainViewController collectionView numberOfSections value is wrong, please check")
    }
    
    func testTotalAlarmItemsCountCheck() {
        let arrayAlarmItemsCount = alarmManagerSharedInstance.alarmItems.count + 1
        XCTAssertEqual(arrayAlarmItemsCount, alarmManagerSharedInstance.totalAlarmItems, "TotalAlarmItems count is wrong, please check")
    }
    
    func testTotalAlarmItemsCountCheckAddOne() {
        let description = "Test alarm description"
        let turnOn = true
        let dateAsString = "24-12-2015 23:59"
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        let deadLine = dateFormatter.dateFromString(dateAsString)!
        
        alarmManagerSharedInstance.alarmItems.append(AlarmItem(description: description, turnOn: turnOn, deadLine: deadLine))
        let arrayAlarmItemsCount = alarmManagerSharedInstance.alarmItems.count + 1
        XCTAssertEqual(arrayAlarmItemsCount, alarmManagerSharedInstance.totalAlarmItems, "TotalAlarmItems count is wrong, please check")
    }
}
