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
        let output = cycleClockWith(30)
        XCTAssert(30 == output.0, "Incorrect out put: \(output)")
        XCTAssert(21600 == output.1, "Incorrect out put: \(output)")
    }
    
    func testBall45() {
        let output = cycleClockWith(45)
        XCTAssert(45 == output.0, "Incorrect out put: \(output)")
        XCTAssert(544320 == output.1, "Incorrect out put: \(output)")
    }
    
    func testPerformanceBall30() {
        self.measureBlock() {
            cycleClockWith(30)
        }
    }
    
}
