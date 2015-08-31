//
//  BallClock-Iteration0.swift
//  BallClock
//
//  Created by Christopher Evans on 8/28/15.
//  Copyright (c) 2015 Morphosis Games. All rights reserved.
//

import Foundation


// MARK: - Data structure

class Track {
    var maxCapacity = 0
    var ramp: NSMutableArray
    var addedCount = 0
    init(let capacity: Int) {
        self.ramp = NSMutableArray(capacity: capacity)
        self.maxCapacity = capacity
    }
    
    func addBall(inout ball: Int, inout queue: NSMutableArray) -> Bool {
        var added = false
        if self.addedCount < self.maxCapacity {
            self.ramp[self.addedCount] = ball
            self.addedCount++
            added = true
        } else {
            //removeBalls = self.ramp.reverse()
            
            for var idx = self.addedCount - 1; idx > -1; idx-- {
                let ball: AnyObject = self.ramp[idx]
                queue.addObject(ball)
            }
            self.addedCount = 0
        }
        
        return added
    }
}

class Clock {
    var queue: NSMutableArray
    var tracks: [Track]
    
    init(inout balls: NSMutableArray, let tracks: [Track]) {
        self.queue = balls
        self.tracks = tracks
    }
    
    func tick() {
        var ball = self.queue[0] as! Int
        self.queue.removeObjectAtIndex(0)
        var ballAdded = false
        for track in tracks {
            if track.addBall(&ball, queue: &self.queue) {
                ballAdded = true
                break
            }
        }
        
        if ballAdded == false {
            self.queue.addObject(ball)
        }
    }
}

// MARK: - Process
func cycleClockWith(let ballCount: Int) -> (ballCount: Int, ticks: Int, processTime: NSTimeInterval) {
    
    var startTime = NSDate()
    
    var startingQueue: NSMutableArray = NSMutableArray(capacity: ballCount)
    var compareQueue: NSMutableArray = NSMutableArray(capacity: ballCount)
    for i in 0..<ballCount {
        startingQueue.addObject(i)
        compareQueue.addObject(i)
    }
    
    var tracks = [  Track(capacity: 4),
                    Track(capacity: 11),
                    Track(capacity: 11) ]
    var clock = Clock(balls: &startingQueue, tracks: tracks)
    
    // MARK: - Run
    var totalTicks = 0
    while true {
        totalTicks++
        
        clock.tick()

        
        if clock.queue.count == ballCount {
            if isEqualToIndexes(clock, ballCount) {
                break
            }
        }
    }
    
    let endTime = NSDate()
    let spent = endTime.timeIntervalSinceDate(startTime)
    
    return (ballCount, totalTicks, spent)
}


func isEqualToIndexes(let clock: Clock, let count: Int) -> Bool {
    var done = true
    for (index, ball) in enumerate(clock.queue) {
        if index != (ball as! Int) {
            done = false
            break
        }
    }
    return done
}


