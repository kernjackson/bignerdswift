//
//  Mayor.swift
//  MonsterTown
//
//  Created by admin on 1/6/16.
//  Copyright © 2016 Kern. All rights reserved.
//

import Foundation

// Silver Challenge
struct Mayor {
    
//    var notification = "something" {
//        
//    }
    
    var population = 5422 {
        // L 16.9 Property Observers
        willSet(asdf) {
            
        }
        
        didSet(oldPopulation) {
            print("Speech #37")
//            if population < oldPopulation {
//                // Bronze Challenge (maybe? too tired to tell)
//                print("The population has changed to \(population) from \(oldPopulation).")
//                
//            }
        }
    }
    
    
    var anxietyLevel: Int = 0 {
        didSet(anxietyLevel) {
            print("anxietyLevel \(anxietyLevel)")
        }
    }
    
    
    
}