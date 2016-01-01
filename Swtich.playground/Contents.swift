//: Playground - noun: a place where people can play

import UIKit

var statusCode: Int = 418
var errorString: String = ""

switch statusCode {
case 300...307:
    errorString = "Redirection, \(statusCode)"
case 400:
    errorString = "Bad request"
case 401:
    errorString = "Unathorized"
case 403:
    errorString = "Forbidden"
case 404:
    errorString = "Not found"
case 405, 406, 407:
    errorString = "No idea what these are"
    fallthrough
case 500...505:
    errorString = " Server error, \(statusCode),"

case let unknownCode where (unknownCode >= 200 && unknownCode < 300)
        || unknownCode > 505:
    errorString = "\(unknownCode) is not a known error code"
    
default:
    errorString += " Please review request and try again"
}

/// tuple
let error = (code: statusCode, error: errorString)
// get by index
error.0
error.1
// or by name
error.code
error.error

// ## Pattern Matching

let firstErrorCode = 404
let secondErrorCode = 0
let errorCodes = (firstErrorCode, secondErrorCode)

switch errorCodes {
case (404, 404):
    print("No items found")
case (404, _):
    print("First item not found.")
case (_, 404):
    print("Second item not found.")
default: print("All items found.")
}

// ## Switch vs if/else
// ## if case - use if case if you have only one case, and don't need a default

let age = 25

switch age {
case 18...35:
    print("Cool demographic")
default:
    break;
}

if case 18...35 = age {
    print("cool demographic")
}

if case 18...35 = age where age >= 21 {
    print("cool demographic that can also legally drink")
}

// Bronze Challenge

let point = (x: 1, y: 4)

switch point {
case let q1 where (point.x > 0) && (point.y > 0):
    print("\(q1) is in quadrant 1")
// I didn't feel like typing the rest (page 46)
default:
    print("Case not covered.")
}