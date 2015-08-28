//: Playground - noun: a place where people can play

import Cocoa

class Ball { }

func ==(let lhs: Ball, let rhs: Ball) -> Bool {
    return lhs === rhs
}

func ==(let lhs: [Ball], let rhs: [Ball]) -> Bool {
    var match = false
    
    if lhs.count == 0 && rhs.count == 0 {
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

func ==(let lhs: [Ball?], let rhs: [Ball?]) -> Bool {
    var match = false
    
    if lhs.count == rhs.count {
        for var index = 0; index < lhs.count; index++ {
            if let leftBall = lhs[index], let rightBall = rhs[index] {
                match = leftBall == rightBall
            }
            
            if match == false {
                break
            }
        }
    }
    
    return match
}

func slideBallsIntoQueue(inout queue: [Ball?], inout balls: [Ball?]) {
    var reverse = balls.reverse()
    queue = reverse + queue
}



var ball1 = Ball()
var ball2 = Ball()

ball1 == ball2
ball1 == ball1


var a1 = [Ball?](count: 4, repeatedValue: Ball())
a1[0]! == a1[1]!

var a2: [Ball?] = [ball1, ball2]
a2[0]! == a2[1]!


var a3: [Ball?] = a2
var a4: [Ball?] = [ball2, ball1]
var a5 = a3
var a6: [Ball?] = [ball1]
var a7: [Ball?] = [ball2]
var a8 = a6
var a9 = a7

a5.append(Ball())

a2 == a4
a2 == a3
a3 == a5
a3 == a2
a6 == a7

slideBallsIntoQueue(&a8, &a9)
a4 == a8
a9.removeAll(keepCapacity: true)
a7


var ab1 = [Ball?](count: 4, repeatedValue: nil)
ab1.count
ab1[0] = ball1
ab1[1] = ball2
ab1[2] = ball1
ab1[3] = ball2
ab1.count



var c1 = [Ball]()
var c2 = c1
c1 == c2

var c3 = c1
c3.append(Ball())
c3.append(Ball())
c3.count
c1.count
c3 == c1

c2.count
c1 == c2














