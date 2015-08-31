//
//  QueueTest.swift
//  BallClock
//
//  Created by Christopher Evans on 8/31/15.
//  Copyright (c) 2015 Morphosis Games. All rights reserved.
//

import Cocoa
import XCTest

class QueueTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func createIndexQueue(size: Int) -> Queue<Int> {
        var queue = Queue<Int>()
        for i in 0..<size {
            queue.enqueue(i)
        }
        return queue
    }
    
    func testEnqueue() {
        var queue = Queue<Int>()
        queue.enqueue(1)
        
        XCTAssert(queue.count == 1)
        XCTAssert(queue.peekFirst() == 1, "Didn't get expected value: \(queue.peekFirst())")
        XCTAssert(queue.peekLast() == nil, "Got unexpected value: \(queue.peekLast())")
    }
    
    func testEnqueue2() {
        var queue = Queue<Int>()
        queue.enqueue(1)
        queue.enqueue(2)
        
        XCTAssert(queue.count == 2)
        XCTAssert(queue.peekFirst() == 1, "Didn't get expected value: \(queue.peekFirst())")
        XCTAssert(queue.peekLast() == 2, "Didn't get expected value: \(queue.peekLast())")
    }
    
    func testEnqueue3() {
        var queue = Queue<Int>()
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)
        
        XCTAssert(queue.count == 3)
        XCTAssert(queue.peekFirst() == 1, "Didn't get expected value: \(queue.peekFirst())")
        XCTAssert(queue.peekLast() == 3, "Didn't get expected value: \(queue.peekLast())")
    }
    
    func testDidqueueWith1() {
        var queue = Queue<Int>()
        queue.enqueue(1)
        var value = queue.dequeue()
        
        XCTAssert(queue.count == 0)
        XCTAssert(value == 1, "Didn't get expected value: \(value)")
    }
    
    func x_testDidqueueWith2() {
        var queue = Queue<Int>()
        queue.enqueue(1)
        queue.enqueue(2)
        
        var value = queue.dequeue()
        
        XCTAssert(value == 1, "Didn't get expected value: \(value)")
        XCTAssert(queue.count == 1)
        XCTAssert(queue.peekFirst() == 1, "Didn't get expected value: \(queue.peekFirst())")
        XCTAssert(queue.peekLast() == nil, "Didn't get expected value: \(queue.peekLast())")
    }
    
    func x_testDidqueueWith3() {
        var queue = Queue<Int>()
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)
        
        var value = queue.dequeue()
        
        XCTAssert(value == 1, "Didn't get expected value: \(value)")
        XCTAssert(queue.count == 2)
        XCTAssert(queue.peekFirst() == 2, "Didn't get expected value: \(queue.peekFirst())")
        XCTAssert(queue.peekLast() == 3, "Didn't get expected value: \(queue.peekLast())")
    }

    func testArrayAdd10000() {
        self.measureBlock { () -> Void in
            createIndexQueue(10000)
        }
    }
    
    func testRemoveTop() {
        var queue = createIndexQueue(10000)
        self.measureBlock() {
            while queue.peekFirst() != nil {
                queue.dequeue()
            }
        }
    }
    
    func x_testOrderCompareMatch() {
        var queue = Queue<Int>()
        var array = [0, 1, 2, 3, 4, 5]
        queue.enqueue(array)
        XCTAssert(queue.orderedCompared(0, forIndex: 0), "Didn't match 0")
        XCTAssert(queue.orderedCompared(1, forIndex: 1), "Didn't match 1")
        XCTAssert(queue.orderedCompared(2, forIndex: 2), "Didn't match 2")
        XCTAssert(queue.orderedCompared(3, forIndex: 3), "Didn't match 3")
        XCTAssert(queue.orderedCompared(4, forIndex: 4), "Didn't match 4")
        XCTAssert(queue.orderedCompared(5, forIndex: 5), "Didn't match 5")
    }
}
