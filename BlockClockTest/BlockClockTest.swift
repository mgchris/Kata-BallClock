//
//  BlockClockTest.swift
//  BlockClockTest
//
//  Created by Christopher Evans on 8/28/15.
//  Copyright (c) 2015 Morphosis Games. All rights reserved.
//

import Cocoa
import XCTest

class BlockClockTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    func testBall30() {
        let string = cycleClockWith(30, false)
        XCTAssert("30 balls cycle after 15 days." == string, "Incorrect string [" + string + "]")
    }
    
    func testBall45() {
        let string = cycleClockWith(45, false)
        XCTAssert("45 balls cycle after 378 days." == string, "Incorrect string [" + string + "]")
    }
    
    func testPerformanceBall30() {
        self.measureBlock() {
            cycleClockWith(30, false)
        }
    }
    
}
