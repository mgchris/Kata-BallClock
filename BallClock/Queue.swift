//
//  Queue.swift
//  BallClock
//
//  Created by Christopher Evans on 8/31/15.
//  Copyright (c) 2015 Morphosis Games. All rights reserved.
//

import Foundation

class QueueNode<T> {
    var value: T?
    var nextNode: QueueNode?
}

class Queue<T: Equatable> {
    private var top: QueueNode<T>! = QueueNode<T>()
    private var last: QueueNode<T>! = QueueNode<T>()
    private var size = 0
    
    var count: Int {
        get {
            return self.size
        }
    }
    
    func enqueue(let value: T) {
        
        if self.top == nil {
            self.top = QueueNode<T>()
        }
        
        if self.top.value == nil {
            self.top.value = value
        } else if self.last.value == nil {
            self.last.value = value
        } else {
            var node = QueueNode<T>()
            node.value = value
            self.last.nextNode = node
            self.last = node
        }
        
        self.size++
    }
    
    func enqueue(let values: [T]) {
        for key in values {
            self.enqueue(key)
        }
    }
    
    func dequeue() -> T? {
        let topItem: T? = self.top?.value
        
        if topItem == nil {
            return nil
        }
        
        var queueItem: T? = self.top.value!
        
        if let nextItem = self.top.nextNode {
            self.top = nextItem
        } else {
            self.top = nil
        }
        
        self.size--
        
        return queueItem
    }
    
    func isEmpty() -> Bool {
        var empty = true
        
        if let topItem = self.top?.value {
            empty = false
        }
        
        return empty
    }
    
    func peekFirst() -> T? {
        return self.top?.value
    }
    
    func peekLast() -> T? {
        return self.last?.value
    }
    
    func orderedCompared(let value: T, let forIndex: Int) -> Bool {
        var match = true
        var last = self.top
        
        if forIndex < self.count {
            for i in 0...self.count {
                if let current = last.nextNode {
                    if let data = current.value {
                        if value != data {
                            match = false
                            break
                        }
                    }
                } else {
                    match = false
                    break
                }
            }
        }
        
        return match
    }
}



