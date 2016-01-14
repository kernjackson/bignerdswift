//
//  Asset.swift
//  CyclicalAssets
//
//  Created by admin on 1/12/16.
//  Copyright © 2016 Kern. All rights reserved.
//

import Foundation

// L 24.3 Defining the
class Asset: CustomStringConvertible {
    let name: String
    let value: Double
    weak var owner: Person?
    
    var description: String {
        if let actualOwner = owner {
            return ""
        } else {
            return ""
        }
    }
    
    init(name: String, value: Double) {
        self.name = name
        self.value = value
    }
    
    deinit {
        print("\(self) is being deallocated")
    }
}