//
//  Vampire.swift
//  MonsterTown
//
//  Created by admin on 1/2/16.
//  Copyright © 2016 Kern. All rights reserved.
//

import Foundation

class Vampire: Monster {
    
    var thralls = [Vampire]()
    
    final override func terrorizeTown() {
        
        if town?.population < 1 {
            town?.population = 0
        } else {
            town?.changePopulation(-1)
            thralls.append(Vampire())
        }
        super.terrorizeTown()
        
        print(thralls.count)
    }
}
