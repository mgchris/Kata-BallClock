//
//  BallClock-Iteration0.swift
//  BallClock
//
//  Created by Christopher Evans on 8/28/15.
//  Copyright (c) 2015 Morphosis Games. All rights reserved.
//

import Foundation


// MARK: - Data setup
class Ball {
    let ballId: Int
    
    init(let ballId: Int) {
        self.ballId = ballId
    }
}

class Track {
    var maxCapacity = 0
    var ramp = [Ball]()
    
    init(let ramp: [Ball], let capacity: Int) {
        self.ramp = ramp
        self.maxCapacity = capacity
    }
    
    func addBall(let ball: Ball) -> [Ball]? {
        var removeBalls: [Ball]?
        
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
    var queue: [Ball]
    var tracks: [Track]
    
    init(let balls: [Ball], let tracks: [Track]) {
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
    
    func currentTime() -> [Int] {
        var counts = [Int](count: self.tracks.count, repeatedValue: 0)
        for (index,track) in enumerate(self.tracks) {
            counts[index] = track.ramp.count
        }
        return counts
    }
}

// MARK: - Foundation work
func ==(let lhs: [Ball], let rhs: [Ball]) -> Bool {
    var match = false
    
    if lhs.isEmpty && rhs.isEmpty {
        match = true
    } else if lhs.count == rhs.count {
        for var index = 0; index < lhs.count; index++ {
            match = lhs[index].ballId == rhs[index].ballId
            if match == false {
                break
            }
        }
    }
    
    return match
}

func cycleClockWith(let ballCount: Int) {
    let startTime = NSDate()
    
    var startingQueue = [Ball]()
    for var index = 0; index < ballCount; index++ {
        startingQueue.append(Ball(ballId: index))
    }
    
    var tracks = [  Track(ramp: [Ball](), capacity: 4),
        Track(ramp: [Ball](), capacity: 11),
        Track(ramp: [Ball](), capacity: 11) ]
    var clock = Clock(balls: startingQueue, tracks: tracks)
    
    // MARK: - Run
    var totalTicks = 0
    while true {
        totalTicks++
        
        clock.tick()
        
        if clock.queue == startingQueue {
            break
        }
    }
    
    let endTime = NSDate()
    let spent = endTime.timeIntervalSinceDate(startTime)
    let days = totalTicks / 24 / 60
    println("\(ballCount) balls cycle after \(days) days  [Processing Time: \(spent.toFormattedString())  Interval: \(spent)]")
}

