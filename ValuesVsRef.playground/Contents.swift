//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"
var playgroundGreeting = str


// String is a a struct which is a value type (always copied)
playgroundGreeting += "! How are you today?"
str

// L 18.3
class GreekGod {
    var name: String
    init(name: String) {
        self.name = name
    }
}

// L 18.4
let hectate = GreekGod(name: "Hectate")

// L 18.5
let anotherHectate = hectate

// L 18.6
anotherHectate.name = "AnotherHectate"
anotherHectate.name
hectate.name

// L 18.7 Constatn Value and reference Types
struct Pantheon {
//    var chiefGod: GreekGod
    // L 18.13 Immutable reference types
    let chiefGod: GreekGod
    let dateCreated = NSDate()
}


// L 18.8
let pantheon = Pantheon(chiefGod: hectate)

// L 18.9
let zeus = GreekGod(name: "Zeus")
// L 18.10
//pantheon.chiefGod = zeus

// L 18.11
zeus.name = "Zeus Jr."
zeus.name

// L 18.12 !! reference type in a value type DO NOT DO THIS!!!
pantheon.chiefGod.name // "AnotherHectate"
let greekPantheon = pantheon
hectate.name = "Trivia"
greekPantheon.chiefGod.name // ???

// L 18.13 Immutable reference types
greekPantheon.dateCreated

// L 18.14 All copies in swift are shallow
let athena = GreekGod(name: "Ahtena")
let gods = [athena, hectate, zeus]

// L 18.15 
let godCopy = gods
gods.last?.name = "Jupiter"
gods
godCopy

// Identity vs Equality
let x = 1
let y = 1
x == y // true
//x === y causes a compiler error

// Use a struct if you want to 
    //( 1) pass by value
    // (2) if nothing needs to inherit from it 
    // (3) if the behavior is relatively simple
// Otherwise use a class (also final will prevent sublassing)





