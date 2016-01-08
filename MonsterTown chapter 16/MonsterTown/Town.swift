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
    // L 16.1, 16.11
    var mayor = Mayor()
    static let region = "South"
    var population = 5422 {
        // L 16.9 Property Observers
        didSet(oldPopulation) {
            
            if population < oldPopulation {
                mayor.anxietyLevel += 1
                // Bronze Challenge (maybe? too tired to tell)
                print("The population has changed to \(population) from \(oldPopulation).")
                
            }
        }
    }
    var numberOfStopLights = 4
    
    // L 16.2 Nested Types
    enum Size {
        case Small
        case Medium
        case Large
    }
    
    // L 16.3 Lazy loading
//    lazy var townSize: Size = {
    // L 16.6 Computed Properties
    var townSize: Size {
        get {
            switch self.population {
            case 0...10000:
                return Size.Small
            case 10001...100000:
                return Size.Medium
            default:
                return Size.Large
            }
        }
    }//()
    
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

