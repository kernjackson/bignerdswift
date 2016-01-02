//: Playground - noun: a place where people can play

import UIKit

var volunteerCounts = [1,3,40,32,2,53,77,13]

// ### We call a function a method when it is defined on a type, like the Array type

// L 13.2 Storing the array
func sortAscending(i: Int, j: Int) -> Bool {
    return i < j
}
let volunteerSorted1 = volunteerCounts.sort(sortAscending)

// L 13.3 Refactored sorting code
let volunteersSorted2 = volunteerCounts.sort({
    (i: Int, j: Int) -> Bool in
    return i < j
})

// L 13.4 Taking advantage of type inference
let volunteerSorted3 = volunteerCounts.sort({ i, j in i < j })
volunteerSorted3

// L 13.5 Using shorthand syntax for arguments
let volunteerSorted4 = volunteerCounts.sort({ $0 < $1 })
volunteerSorted4

// L 13.6 Inline closure as the function's final argument
let volunteerSorted = volunteerCounts.sort { $0 < $1 }

// L 13.7 Functions as return types
func oldMakeTownGrand() -> (Int, Int) -> Int {
    func buildRoads(lightsToAdd: Int, toLights: Int) -> Int {
        return toLights + lightsToAdd
    }
    return buildRoads
}

// L 13.8 Exercise the function
var stopLights = 4
let townPlan = oldMakeTownGrand()
stopLights = townPlan(4, stopLights)
print("Knowhere as \(stopLights) stopLights.")

// L 13.9 Functinos as arguments
func makeTownGrand(budget: Int, condition: Int -> Bool) -> ((Int, Int) -> Int)? {
    if condition(budget) {
        func buildRoads(lightsToAdd: Int, toLights: Int) -> Int {
            return toLights + lightsToAdd
        }
        return buildRoads
    } else {
        return nil
    }
}
func evaluateBudget(budget: Int) -> Bool {
    return budget > 10000
}

stopLights = 4

if let townPlan = makeTownGrand(1000, condition: evaluateBudget) {
    stopLights = townPlan(4, stopLights)
}
if let newTownPlan = makeTownGrand(10500, condition: evaluateBudget) {
    stopLights = newTownPlan(4, stopLights)
}

print("Knowhere has \(stopLights) stoplights.")

// L 13.11 Closures capture value
func makeGrowthTracker(forGrowth growth: Int) -> () -> Int {
    var totalGrowth = 0
    func growthTracker() -> Int {
        totalGrowth += growth
        return totalGrowth
    }
    return growthTracker
}
var currentPopulation = 5422
let growBy500 = makeGrowthTracker(forGrowth: 500)

// L 13.12
growBy500()
growBy500()
growBy500()
currentPopulation += growBy500() // currentPopulation is now 7422

// L 13.13 Closures are reference types
let anotherGrowBy500 = growBy500
anotherGrowBy500() // totalGrowth is now 2500

// L 13.14 another closure reference
var someOtherPopulation = 4061981
let growBy1000 = makeGrowthTracker(forGrowth: 10000)
someOtherPopulation += growBy1000()
currentPopulation

// L 13.15 Setting populations by precinct
let precinctPopulations = [1244, 2021, 2157]

// L 13.16 Using map(_:) to estimate population
let projectedPopulations = precinctPopulations.map {
    (population: Int) -> Int in
    return population * 2
}
projectedPopulations

// L 13.17 filter(_:)
let bigProjections = projectedPopulations.filter {
    (projection: Int) -> Bool in
    return projection > 4000
}
bigProjections

// 13.18 reduce(_:combine:)
let totalProjection = projectedPopulations.reduce(0) {
    (accumulatedProjection: Int, precinctProjection: Int) -> Int in
    return accumulatedProjection + precinctProjection
}

// Gold Challenge






