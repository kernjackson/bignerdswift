//: Playground - noun: a place where people can play

import UIKit

// ## Optional Types

var errorCodeString: String?
errorCodeString = "404"

// L 8.3
print(errorCodeString)

// L 8.4
if errorCodeString != nil {
    let theError = errorCodeString!
    print(theError)
}

// ## Optional Binding
// L 8.5
if let theError = errorCodeString {
    print(theError)
}

// L 8.6 - Nesting Optional Binding
if let theError = errorCodeString {
    if let errorCodeInteger = Int(theError) {
        print("\(theError): \(errorCodeInteger)")
    }
}

// L 8.7 Unwrapping Multiple Optionals
if let theError = errorCodeString, errorCodeInteger = Int(theError) {
    print("\theError): \(errorCodeInteger)")
}

// L 8.8 Optinal binding and where clauses
if let theError = errorCodeString, errorCodeInteger = Int(theError) where errorCodeInteger == 404 {
    print("\theError): \(errorCodeInteger)")
}

// ## Implicitly Unwrapped Optionals
// Danger! use this sparingly, typically used in init()
var implictlyUnwrappedString: String!
implictlyUnwrappedString = "404"
print(implictlyUnwrappedString)

// ## Optional Chaining

// L 8.9 Optional chaning
var errorDescription: String?
if let theError = errorCodeString, errorCodeInteger = Int(theError) where errorCodeInteger == 404 {
    errorDescription = ("\(errorCodeInteger + 200): the requested resource was not found.")
}

var upCaseErrorDescription = errorDescription?.uppercaseString
errorDescription

// ## Modifying an Optional in Place

// L 8.10 Modifying in place

upCaseErrorDescription?.appendContentsOf(" PLEASE TRY AGAIN.")
upCaseErrorDescription

// # The Nil Coalescing Operator

// L 8.11 Using optional binding to parse errorCodeString
let description: String
if let errorDescription = errorDescription {
    description = errorDescription
} else {
    description = "No error"
}

// L 8.12 Using the nil coalescing operator

let description2 = errorDescription ?? "No error"

// ## Silver Challenge

//var silverString: String?
//    let test = silverString!








