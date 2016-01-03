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

// L 15.8
myTown.changePopulation(500)
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