//
//  Zombie.swift
//  MonsterTown
//
//  Created by admin on 1/2/16.
//  Copyright © 2016 Kern. All rights reserved.
//

import Foundation

// L 15.12 Zombie creation
class Zombie: Monster {
    var walksWithLimp = true
    
    // For the more curious: Type Methods
    class func makeSpookyNoise() -> String {
        return "Brains..."
    }
    
    // 15.13 final prevents subclasses from overriding this func
    final override func terrorizeTown() {
        if town?.population < 11 {
            town?.population = 0
        } else {
            town?.changePopulation(-10)
        }
        super.terrorizeTown()
    }
    
    func changeName(name: String, walksWithLimp: Bool) {
        self.name = name
        self.walksWithLimp = walksWithLimp
    }
}