//
//  main.swift
//  CyclicalAssets
//
//  Created by admin on 1/12/16.
//  Copyright © 2016 Kern. All rights reserved.
//

import Foundation



// Strong references increment the reference count of the instance they refer to


// L 24.2 Creating an optional Person
var bob: Person? = Person(name: "Bob")
print("Created \(bob)")

// L 24.4 Creating assets
var laptop: Asset? = Asset(name: "Shiny laptop", value: 1500.00)
var hat: Asset? = Asset(name: "Cowboy Hat", value: 175.0)
var backpack: Asset? = Asset(name: "Blue Backpack", value: 45.0)

// L 24.6 Bob is taking ownership
bob?.takeOwnershipOfAsset(laptop!)
bob?.takeOwnershipOfAsset(hat!)

bob = nil
print("the bob variable is now \(bob)")

laptop = nil
hat = nil
backpack = nil



