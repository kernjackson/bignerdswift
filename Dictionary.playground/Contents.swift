//: # 10 Dictionaries

import UIKit

// L 10.1 Create a dictionary using 'Literal' syntax
var movieRatings = ["Donnie Darko": 4, "Chungking Express": 5, "Dark City": 4]

// L 10.2
print("I have rated \(movieRatings.count) movies.")

// Properties are variables on a type that store or compute some data about the type

// L 10.3 Reading a value form a dictionary
let darkoRating = movieRatings["Donnie Darko"]

// L 10.4 Modifying value
movieRatings["Dark City"] = 5
movieRatings

// L 10.5 Optional Binding
// updateValue(_:forKey:) returns an optional, so assign that to an optional
let oldRating: Int? = movieRatings.updateValue(5, forKey: "Donnie Darko")
if let lastRating = oldRating, currentRating = movieRatings["Donnie Darko"] {
    print("Old rating: \(lastRating); current rating: \(currentRating)")
}

// L 10.6 Adding a value
movieRatings["The Cabinet of Dr. Caligari"] = 5

// L 10.7 Removing a value
movieRatings.removeValueForKey("Dark City")

// L 10.8 Settings a key's value to nil
movieRatings["Dark City"] = nil

// ## Looping

// L 10.9 Looping through your dictionary
for (key, value) in movieRatings {
    print("The movie \(key) was reated \(value).")
}

// L 10.10 Just the keys, please
for movie in movieRatings.keys {
    print("User has rated \(movie).")
}

// L 10.11 Creating an immutable dictionary
let album = ["Diet Roast Beef": 268, "Dubba Stubs His Toe": 467]

// ## Translating a Dicionary to an Array

// L 10.12 Sending keys to an array
let watchedMovies = Array(movieRatings.keys)

// Silver Challenge
let state = [
    "oklahoma": Array([12345, 12346, 12347, 12348, 12349]),
    "latimer":  Array([22345, 12346, 12347, 12348, 12349]),
    "logan":    Array([32345, 12346, 12347, 12348, 12349])
]

for zip in state.values {
    print("\(zip)")
}

