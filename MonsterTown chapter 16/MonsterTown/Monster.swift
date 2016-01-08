//
//  Monster.swift
//  MonsterTown
//
//  Created by admin on 1/2/16.
//  Copyright © 2016 Kern. All rights reserved.
//

import Foundation

class Monster {
    // L 16.16 
    static let isTerrifying = true
    
    // L 16.14 Generic Monster noise
    class var spookyNoise: String {
        return "Grrr"
    }
    
    var town: Town?
    var name = "Monster"
    
    // L 16.7 Getters and Setters
    var victimPool: Int {
        get {
            return town?.population ?? 0
        }
        set(newVictimPool) {
            town?.population = newVictimPool
        }
    }
    
    func terrorizeTown() {
        if town != nil {
            print("\(name) is terrorizing a town!")
        } else {
            print("\(name) hasn't found a town to terrorize yet...")
        }
    }
    
    
}