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
    var plistName = AlarmManager.sharedInstance.plistName
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        deletePlist()
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
        
        alarmManagerSharedInstance.alarmItems.append(AlarmItem(title: "Tmp Title", active: false, date: NSDate()))
        let arrayAlarmItemsCount = alarmManagerSharedInstance.alarmItems.count + 1
        XCTAssertEqual(arrayAlarmItemsCount, alarmManagerSharedInstance.totalAlarmItems, "TotalAlarmItems count is wrong, please check")
    }
    
    func createPlist() {
        // Given
        let documentDirectory = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as NSString
        let fullPathName = documentDirectory.stringByAppendingString(plistName)
        let fileManager = NSFileManager.defaultManager()
        
        // When
        if !fileManager.fileExistsAtPath(fullPathName) {
            fileManager.createFileAtPath(fullPathName, contents: nil, attributes: nil)
        }
        
        // Then
        XCTAssertTrue(fileManager.fileExistsAtPath(fullPathName), "Create Fail")
    }
    
    func deletePlist() {
        // Given
        let documentDirectory = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as NSString
        let fullPathName = documentDirectory.stringByAppendingString(plistName)
        let fileManager = NSFileManager.defaultManager()
        
        // When
        if fileManager.fileExistsAtPath(fullPathName) {
            do {
                try fileManager.removeItemAtPath(fullPathName)
            } catch {
                XCTFail("Delete Fail..")
            }
        } else {
            
        }
        
        // Then
        XCTAssertTrue(!fileManager.fileExistsAtPath(fullPathName), "Delete Fail")
    }
    
    func testAlarmAddCheck() {
        // Given When then
        XCTAssertTrue(!AlarmManager.sharedInstance.addPlistItem("Tmp Title", active: true, date: NSDate()), "Create")
    }
}
