//
//  Person.swift
//  CyclicalAssets
//
//  Created by admin on 1/12/16.
//  Copyright © 2016 Kern. All rights reserved.
//

import Foundation

class Person: CustomStringConvertible {
    let name: String
    var assets = [Asset]()
    
    var description: String {
        return "Person(/(name))"
    }
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(self) is being deallocated")
    }
    
    // L 24.5 Letting a Person own assets
    func takeOwnershipOfAsset(asset: Asset) {
        asset.owner = self
        assets.append(asset)
    }
}