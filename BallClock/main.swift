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

let start = NSDate()
for i in 27...127 {
    cycleClockWith(i, true)
}
let end = NSDate()
let interval = end.timeIntervalSinceDate(start)
println("Total processing Time: \(interval.toFormattedString())")






