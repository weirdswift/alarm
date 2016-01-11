//
//  AlarmManagerTests.swift
//  Alarm
//
//  Created by ShinSheungmin on 12/20/15.
//  Copyright © 2015 HappyEngineer. All rights reserved.
//

import XCTest
import Foundation

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
        
        alarmManagerSharedInstance.alarmItems.append(AlarmItem(title: description, turnOn: turnOn, deadLine: deadLine))
        let arrayAlarmItemsCount = alarmManagerSharedInstance.alarmItems.count + 1
        XCTAssertEqual(arrayAlarmItemsCount, alarmManagerSharedInstance.totalAlarmItems, "TotalAlarmItems count is wrong, please check")
    }
    
    func deletePListFile() -> Bool {
        let plistFile = alarmManagerSharedInstance.plistFile
        if let documentsDirectory = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first as NSString? {
            let plistPath = documentsDirectory.stringByAppendingPathComponent(plistFile)
            
            let fileManager = NSFileManager.defaultManager()
            if fileManager.fileExistsAtPath(plistPath) {
                fileManager.delete(nil)
            }
            return true
        } else {
            return false
        }
    }
    
    func createPListFile() -> Bool {
        let plistFile = alarmManagerSharedInstance.plistFile
        if let documentsDirectory = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first as NSString? {
            let plistPath = documentsDirectory.stringByAppendingPathComponent(plistFile)
            
            let fileManager = NSFileManager.defaultManager()
            if fileManager.fileExistsAtPath(plistPath) {
                do {
                    try fileManager.removeItemAtPath(plistPath as String)
                } catch {
                    XCTFail("PList file can removed. Can't test progressing.")
                }
            }
            
            let alarmTestArray: NSArray = [
                AlarmItem(title: "alarmItem1", turnOn: true, deadLine: NSDate()),
                AlarmItem(title: "alarmItem2", turnOn: false, deadLine: NSDate()),
                AlarmItem(title: "alarmItem3", turnOn: true, deadLine: NSDate()),
                AlarmItem(title: "alarmItem4", turnOn: false, deadLine: NSDate())
            ]
            
            return NSKeyedArchiver.archivedDataWithRootObject(alarmTestArray).writeToFile(plistPath, atomically: true)
        } else {
            return false
        }
    }
    
    func testPListFileDelete() {
        if createPListFile() {
            let plistFileExist = alarmManagerSharedInstance.deletePListFile()
            XCTAssert(plistFileExist, "PList file delete is failed.")
        } else {
            XCTFail("PList file is not created. Can't test progressing.")
        }
    }
    
//    func testPListFileCreate() {
//        let pListFileExist = alarmManagerSharedInstance.createPListFile()
//        XCTAssert(pListFileExist, "PList file create is failed.")
//    }
    
//    func testPListFileCheckForExist() {
//        let plistFileExis = alarmManagerSharedInstance.checkPListFile()
//        XCTAssert(plistFileExis, "PList file is not existance")
//    }
}
