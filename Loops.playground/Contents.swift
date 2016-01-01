//: Playground - noun: a place where people can play

import UIKit

var myFirstInt: Int = 0

for i in 1...5 {
    ++myFirstInt
    print("myFirstInt: \(myFirstInt) i: \(i)")
}

// ## for case (page 50)

for case let i in 1...100 where i % 3 == 0 {
    print(i)
}

// ## while loop - use when you don't know how many iterations you need

var i = 1
while i < 6 {
    ++myFirstInt
    print(myFirstInt)
    ++i
}

// ## repeat-while loops - ensures it fires at least once

var shields = 3
repeat {
    // Fire blasters!
    shields--
    print("Fire blasters!")
} while shields > 0


// Bronze Challenge

for case let i in 0...100 where i % 2 == 0 {
    i
}

