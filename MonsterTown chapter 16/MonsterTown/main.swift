//
//  main.swift
//  MonsterTown
//
//  Created by admin on 1/2/16.
//  Copyright © 2016 Kern. All rights reserved.
//

import Foundation

// L 15.4
var myTown = Town()
//print("Population: \(myTown.population), number of stopLights: \(myTown.numberOfStopLights)")
//
//// L 15.6
//myTown.printTownDescription()

// L 16.4 using the lazy townSize property
let ts = myTown.townSize
print(ts)

// L 15.8
//myTown.changePopulation(500)

// L 16.5 Properties marked with lazy are only calculated 1x
myTown.changePopulation(10000)
print("Size: \(myTown.townSize); population: \(myTown.population)")
//myTown.printTownDescription()

//// L 15.11 Settings a generic monster loose
//let gm = Monster()
//gm.town = myTown
//gm.terrorizeTown()

// L 15.15 
let fredTheZombie = Zombie()
fredTheZombie.town = myTown
fredTheZombie.terrorizeTown()
fredTheZombie.town?.printTownDescription()

// L 15.17
fredTheZombie.changeName("Fred the zombie", walksWithLimp: false)

// Bronze Challenge
var tinyTown = Town()
tinyTown.changePopulation(-1)
let timTheZombie = Zombie()
timTheZombie.town = tinyTown
timTheZombie.terrorizeTown()
timTheZombie.town?.printTownDescription()

// Silver Challenge
var bavarianVillage = Town()
bavarianVillage.changePopulation(12)
let duckula = Vampire()
duckula.town = bavarianVillage
duckula.terrorizeTown()
duckula.town?.printTownDescription()

// For the more curious: Type Methods
//let sppokyNoise = Zombie.makeSpookyNoise() // "Brains..."
// L 16.3
print(Zombie.spookyNoise)
// L 16.17 .dot syntax
if Zombie.isTerrifying {
    print("Run away!")
}

// L 16.8 Using victimPool
print("Victim pool: \(fredTheZombie.victimPool)")
fredTheZombie.victimPool = 500
//print("Victim pool: \(fredTheZombie.victimPool); population: \(fredTheZombie.town?.population)")

// L 16.10 Property Observers
print("Victim pool: \(fredTheZombie.victimPool)")



