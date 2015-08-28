//
//  main.swift
//  BallClock
//
//  Created by Christopher Evans on 8/27/15.
//  Copyright (c) 2015 Morphosis Games. All rights reserved.
//

/*
    Recorded time:
    8/27/2015: 1:10:56
    8/28/2015: forgot to record for at least 20 minutes
    8/28/2015:
        I was trying to build faster one first, but need to first build it


*/


import Foundation

// MARK: - Data setup
class Ball { }

class Tracks {
    var maxSize = 0
    var balls = [Ball]()
    
    func addBall(inout ball: Ball) -> [Ball]? {
        var removeBalls: [Ball]?

        if self.balls.count < maxSize - 1 {
            balls.append(ball)
        } else {
            removeBalls = self.balls
            self.balls.removeAll(keepCapacity: true)
        }
        
        return removeBalls
    }
}

class Clock {
    var balls: [Ball]
    var tracks: [Tracks]
    
    init(inout balls: [Ball], inout tracks: [Tracks]) {
        self.balls = balls
        self.tracks = tracks
    }
    
    func tick() {
        
        
        
    }
}

// MARK: - Foundation work
func ==(inout lhs: [Ball], inout rhs: [Ball]) -> Bool {
    var match = false
    
    println("lhs count: \(lhs.count)  empty: \(lhs.isEmpty)")
    println("rhs count: \(rhs.count)  empty: \(rhs.isEmpty)")
    
    if lhs.isEmpty && rhs.isEmpty {
        match = true
    } else if lhs.count == rhs.count {
        
        for var index = 0; index < lhs.count; index++ {
            match = lhs[index] === rhs[index]
            
            if match == false {
                break
            }
        }
    }
    
    return match
}

func slideBallsIntoQueue(inout queue: [Ball], inout balls: [Ball]) {
    for ball in balls {
        queue.append(ball)
    }
}

// MARK: - Input setup
let size = 30
var mainQueue = [Ball]()

for var index = 0; index < size; index++ {
    mainQueue.append(Ball())
}

var matchQueue = mainQueue

let minuteQueueSize = 4
let fiveMinuteQueueSize = 11
let hourQueueSize = 11

var minuteQueue = [Ball]()
var fiveMinuteQueue = [Ball]()
var hourQueue = [Ball]()



// MARK: - Run
var matchFound = false
while matchFound {
    
    var ball = mainQueue.removeLast()
    
    if minuteQueue.count < minuteQueueSize {
        minuteQueue.append(ball)
    } else {
        slideBallsIntoQueue(&matchQueue, &minuteQueue)
        
        // Add ball to next queue 
        
    }
}






