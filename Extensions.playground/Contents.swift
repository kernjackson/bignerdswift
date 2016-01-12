//: Playground - noun: a place where people can play

import Cocoa

// ## Extending an Existing Type

// L 21.2 Establishing a type alias
typealias Velocity = Double
// L 21.2 Extending Velocity to support mph and kph
extension Velocity {
    var kph: Velocity { return self * 1.60934 }
    var mph: Velocity { return self }
}

protocol VehicleType {
    var topSpeed: Velocity { get }
    var numberOfDoors: Int { get }
    var hasFlatbed: Bool { get }
}

struct Car {
    let make: String
    let model: String
    let year: Int
    let color: String
    let nickname: String
    var gasLevel: Double {
        willSet {
            precondition(newValue <= 1.0 && newValue >= 0.0, "New value must be between 0 and 1.")
        }
    }
}

// L 21.5 Extending Car to conform to VehicleType
extension Car: VehicleType {
    var topSpeed: Velocity { return 180 }
    var numberOfDoors: Int { return 4 }
    var hasFlatbed: Bool { return false }
}

// L 21.6 Adding an initializer with an extension
extension Car {
    init(carMake: String, carModel: String, carYear: Int) {
        self.init(make: carMake,
            model: carModel,
            year: carYear,
            color: "Black",
            nickname: "N/A",
            gasLevel: 1.0)
    }
}
// L 21.7 An isntance of Car
var c = Car(carMake: "Ford", carModel: "Fusion", carYear: 2013)

// L 21.8 Creating an extension with a nested type
extension Car {
    enum CarKind: CustomStringConvertible {
        case Coupe, Sedan
        var description: String {
            switch self {
            case .Coupe:
                return "Coupe"
            case Sedan:
                return "Sedan"
            }
        }
    }
    var kind: CarKind {
        if numberOfDoors == 2 {
            return .Coupe
        } else {
            return .Sedan
        }
    }
}
// L 21.9 Accessing kind
c.kind.description

// ## Extensions with functions

// L 21.10 Using an extension to add functions
extension Car {
    mutating func emptyGas(amount: Double) {
        precondition(amount <= 1 && amount > 0,
            "Amount to remove must be between 0 and 1.")
        gasLevel -= amount
        //print(gasLevel)
    }
    
    mutating func fillGas() {
        gasLevel = 1.0
    }
}
c.emptyGas(0.3)
c.fillGas()
c.gasLevel
c.emptyGas(0.3)
c.gasLevel

// Bronze Challenge
