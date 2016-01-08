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
    
    // For the more curious: Type Methods
//    class func makeSpookyNoise() -> String {
//        return "Brains..."
//    }
    // L 16.12 Since the above takes no arguments it makes a great candidate for being a computed type property instead. L 16.14 had to add override
    override class var spookyNoise: String {
        return "Brains..."
    }
    
    var walksWithLimp = true
    
    // L 16...20 Access Control
//    private var isFallingApart = false
//    internal private(set) var isFallingApart = false
    private(set) var isFallingApart = false
  
    final override func terrorizeTown() {
        if !isFallingApart {
            town?.changePopulation(-10)
        } else {
            super.terrorizeTown()
        }
    }
    
    // 15.13 final prevents subclasses from overriding this func
//    final override func terrorizeTown() {
//        if town?.population < 11 {
//            town?.population = 0
//        } else {
//            town?.changePopulation(-10)
//        }
//        super.terrorizeTown()
//    }
    
    func changeName(name: String, walksWithLimp: Bool) {
        self.name = name
        self.walksWithLimp = walksWithLimp
    }
}