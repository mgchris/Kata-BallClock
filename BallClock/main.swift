//
//  main.swift
//  BallClock
//
//  Created by Christopher Evans on 8/27/15.
//  Copyright (c) 2015 Morphosis Games. All rights reserved.
//

/*
    Recorded time:
    8/27/2015: 1:11:00
    8/28/2015: +0:20:00 forgot to record for at least 20 minutes
    8/28/2015: 2:02:00 I was trying to build faster one first, but need to first build it
    8/28/2015: +0:30:00 Add time working on simpler version
    8/28/2015: 1:00:00 Got the expected time for the input


*/


import Foundation


func simpleProcess() {
    let start = NSDate()
    var output = [(Int, Int, NSTimeInterval)?](count: 101, repeatedValue: nil)
    for i in 27...127 {
        let data = cycleClockWith(i)
        
        output[i - 27] = data
    }
    
    var minimumTicks = 0
    for data in output {
        if let tuple = data {
            let days = tuple.1 / 24 / 60
            println("\(tuple.0) balls cycle after \(days) days. time: \(tuple.2.toFormattedString())")
            minimumTicks += tuple.1
        }
    }
    
    let end = NSDate()
    let interval = end.timeIntervalSinceDate(start)
    
    println("\n\nTotal processing Time: \(interval.toFormattedString()) Minimum Ticks \(minimumTicks)")
}


func gcdProcess() {
    let start = NSDate()

    var output = [Int: (Int, Int, NSTimeInterval)]()
    let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)
    let postProcesQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)
    
    let processCount = 101
    
    dispatch_apply(processCount, queue) { (index) -> Void in
        let idx = index + 27
        let data = cycleClockWith(idx)
        
        dispatch_async(postProcesQueue, { () -> Void in
            output[index] = data
        })
    }
    
    dispatch_sync(postProcesQueue, { () -> Void in
        var minimumTime: NSTimeInterval?
        for i in 0..<processCount {
            let data = output[i]!

            let balls = data.0
            let ticks = data.1
            let time = data.2
            
            let days = ticks / 24 / 60
            
            let string = "\(balls) balls cycle after \(days) days."
            
            if let mTime = minimumTime {
                if time > mTime {
                    minimumTime = time
                }
            } else {
                minimumTime = time
            }
            
            println(string + " time: \(time.toFormattedString())")
        }
        
        let end = NSDate()
        let interval = end.timeIntervalSinceDate(start)
        
        println("\n\nTotal processing Time: \(interval.toFormattedString())  Minimum time: \(minimumTime!.toFormattedString())")

    })
}


// MARK: - Run
//gcdProcess()
simpleProcess()


