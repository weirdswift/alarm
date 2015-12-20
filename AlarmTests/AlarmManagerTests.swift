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
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInstanceAlarmManagerIsNotNil() {
        XCTAssertNotNil(alarmManagerSharedInstance, "AlarmManager is nil")
    }
    
    func testNumberOfSectionsInMainCollectionView() {
        let numberOfSectionsInMainViewController_is_One = 1
        let numberOfSections = alarmManagerSharedInstance.numberOfSectionsInMainCollectionView
        XCTAssertEqual(numberOfSections, numberOfSectionsInMainViewController_is_One, "MainViewController collectionView numberOfSections value is wrong, please check")
    }
}
