//
//  Helper.swift
//  BallClock
//
//  Created by Christopher Evans on 8/28/15.
//  Copyright (c) 2015 Morphosis Games. All rights reserved.
//

import Foundation


extension NSTimeInterval {
    func toFormattedString() -> String {
        let interval = Int(self)
        let milliseconds = Int((self - NSTimeInterval(interval)) * 100)
        let seconds = interval % 60
        let minutes = (interval / 60) % 60
        let hours = (interval / 3600)
        return String(format: "%02d:%02d:%02d:%02d", hours, minutes, seconds, milliseconds)
    }
}