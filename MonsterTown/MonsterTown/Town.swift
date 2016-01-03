//
//  Town.swift
//  MonsterTown
//
//  Created by admin on 1/2/16.
//  Copyright © 2016 Kern. All rights reserved.
//

import Foundation

// L 15.2...3 Declaring a struct (Town.swift)
struct Town {
    var population = 10
    var numberOfStopLights = 4
    
    // L 15.5 Instance methods
    func printTownDescription() {
        print("Population: \(population); number of stoplights: \(numberOfStopLights)")
    }
    
    // L 15.7 Mutating methods
    mutating func changePopulation(amount: Int) {
        population += amount
    }
    
    mutating func setPopulation(amount: Int) {
        population = amount
    }
    
    
}

