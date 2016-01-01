//: Playground - noun: a place where people can play

import UIKit

let playground = "Hello, playground"
var mutablePlayground = "Hello, mutable playground"

mutablePlayground += "!"

for c: Character in mutablePlayground.characters {
    print("\(c)")
}

let oneCoolDude = "\u{1F60E}"

// In swift every character is an extended grapheme cluster
let aAcute = "\u{0061}\u{0301}"
let aAcutePrecomposed = "\u{00E1}"

// Canonical eqauivalence - whether two unicdoe scalars are the same linguistically
let b = (aAcute == aAcutePrecomposed) // true

print("aAcute: \(aAcute.characters.count); aAcuteDecomposed: \(aAcutePrecomposed.characters.count)")

for scalar in playground.unicodeScalars {
    print("\(scalar.value)")
}

// L 7.11 Finding the fifth character

let fromStart = playground.startIndex
let toPosition = 4 // The first position is 0
let end = fromStart.advancedBy(toPosition)
let fifthCharacter = playground[end] // 'o'

// L 7.12 Pulling out a range

let range = fromStart...end
let firstFive = playground[range] // 'Hello'

// ## Silver Challenge

// I don't see the point of this challenge
