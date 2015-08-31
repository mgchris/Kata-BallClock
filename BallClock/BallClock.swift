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
    var ramp = [Int]()
    
    init(let ramp: [Int], let capacity: Int) {
        self.ramp = ramp
        self.maxCapacity = capacity
    }
    
    func addBall(let ball: Int) -> [Int]? {
        var removeBalls: [Int]?
        
        if self.ramp.count < self.maxCapacity {
            ramp.append(ball)
        } else {
            removeBalls = self.ramp.reverse()
            self.ramp.removeAll(keepCapacity: true)
        }
        
        return removeBalls
    }
}

class Clock {
    var queue: [Int]
    var tracks: [Track]
    
    init(let balls: [Int], let tracks: [Track]) {
        self.queue = balls
        self.tracks = tracks
    }
    
    func tick() {
        var ball = self.queue.removeAtIndex(0)
        var ballAdded = false
        for track in tracks {
            if let overflow = track.addBall(ball) {
                self.queue += overflow
            } else {
                ballAdded = true
                break
            }
        }
        
        if ballAdded == false {
            self.queue.append(ball)
        }
    }
}

// MARK: - Process
func cycleClockWith(let ballCount: Int) -> (ballCount: Int, ticks: Int, processTime: NSTimeInterval) {
    
    var startTime = NSDate()
    
    var startingQueue = [Int]()
    for i in 0..<ballCount {
        startingQueue.append(i)
    }
    
    var tracks = [  Track(ramp: [Int](), capacity: 4),
                    Track(ramp: [Int](), capacity: 11),
                    Track(ramp: [Int](), capacity: 11) ]
    var clock = Clock(balls: startingQueue, tracks: tracks)
    
    // MARK: - Run
    var totalTicks = 0
    while true {
        totalTicks++
        
        clock.tick()
        
//        if clock.queue == startingQueue {
//            break
//        }
//        
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
        if index != ball {
            done = false
            break
        }
    }
    return done
}


