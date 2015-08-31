//
//  Queue.swift
//  BallClock
//
//  Created by Christopher Evans on 8/31/15.
//  Copyright (c) 2015 Morphosis Games. All rights reserved.
//

import Foundation

class QueueNode<T> {
    var key: T?
    var next: QueueNode?
}

class Queue<T> {
    private var top: QueueNode<T>! = QueueNode<T>()
    private var size = 0
    
    var count: Int {
        get {
            return self.size
        }
    }
    
    func enqueue(var key: T) {
        
        if self.top == nil {
            self.top = QueueNode<T>()
        }
        
        if self.top.key == nil {
            self.top.key = key
        } else {
        
            var childToUse = QueueNode<T>()
            var current = top
            
            while current.next != nil {
                current = current.next!
            }
            
            childToUse.key = key
            current.next = childToUse
        }
        
        self.size++
    }
    
    func dequeue() -> T? {
        let topItem: T? = self.top?.key
        
        if topItem == nil {
            return nil
        }
        
        var queueItem: T? = self.top.key!
        
        if let nextItem = self.top.next {
            self.top = nextItem
        } else {
            self.top = nil
        }
        
        return queueItem
    }
    
    func isEmpty() -> Bool {
        var empty = true
        
        if let topItem = self.top?.key {
            empty = false
        }
        
        return empty
    }
    
    func peek() -> T? {
        return self.top.key
    }
}



