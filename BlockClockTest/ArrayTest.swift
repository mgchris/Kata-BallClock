//
//  ArrayTest.swift
//  BallClock
//
//  Created by Christopher Evans on 8/30/15.
//  Copyright (c) 2015 Morphosis Games. All rights reserved.
//

import Cocoa
import XCTest

class ArrayTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func createIndexArray(size: Int) -> [Int] {
        var array = [Int]()
        for i in 0..<size {
            array.append(i)
        }
        return array
    }

    func testArrayAdd10000() {
        self.measureBlock { () -> Void in
           createIndexArray(10000)
        }
    }
    
    func testArrayReverse() {
        var array = createIndexArray(10000)
        self.measureBlock() {
            var reverse = array.reverse()
        }
    }

    func testRemoveTop() {
        var array = createIndexArray(10000)
        self.measureBlock() {
            for item in array {
                var top = array.removeAtIndex(0)
            }
        }
    }
    
    func testRemoveLast() {
        var array = createIndexArray(10000)
        self.measureBlock() {
            for item in array {
                var top = array.removeLast()
            }
        }
    }
    
    func testAddArrayToEnd() {
        var array1 = createIndexArray(10000)
        var array2 = createIndexArray(10000)
        self.measureBlock() {
            array1 += array2
        }
    }
    
    func testAddArrayToFront() {
        var array1 = createIndexArray(10000)
        var array2 = createIndexArray(10000)
        self.measureBlock() {
            array1 = array2 + array1
        }
    }
    
    func testCompareIntArraySame() {
        var array1 = createIndexArray(10000)
        var array2 = createIndexArray(10000)
        self.measureBlock() {
            XCTAssert(array1 == array2, "The Array's dont match!")
        }
    }
    
    func testCompareIntArrayDifferent() {
        var array1 = createIndexArray(10000)
        var array2 = createIndexArray(9999)
        array2.append(10101)
        self.measureBlock() {
            XCTAssert(array1 != array2, "The Array's dont match!")
        }
    }
    
    func testCompareIntArrayDifferentSizes() {
        var array1 = createIndexArray(10000)
        var array2 = createIndexArray(5000)
        self.measureBlock() {
            XCTAssert(array1 != array2, "The Array's dont match!")
        }
    }
}




