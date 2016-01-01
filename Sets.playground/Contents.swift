//: 11 Sets

// L 11.1 Creating a set
var oldGroceryBag = Set<String>()

// L 11.2 Adding to a set
oldGroceryBag.insert("Apples")
oldGroceryBag.insert("Oranges")
oldGroceryBag.insert("Bananas")

// L 11.3 Looping through a set
for food in oldGroceryBag {
    print(food)
}

// L 11.4 Creating a set, redux
//var groceryBag = Set(["Apples", "Oranges", "Bananas"]) // or using array literal syntax...
var groceryBag: Set = ["Apples", "Oranges", "Bananas"]

for food in groceryBag {
    print(food)
}

// L 11.5 Has bananas?
let hasBananas = groceryBag.contains("Bananas")

// ## Union, Insersect, Disjoint

// L 11.6 Combining sets
let friendsGroceryBag = Set(["Bananas", "Cereal", "Milk", "Oranges"])
var commonGroceryBag = groceryBag.union(friendsGroceryBag)

// L 11.7 Intersecting sets
let roomatesGroceryBag = Set(["Apples", "Bananas", "Cereal", "Toothpaste"])
let itemsToReturn = commonGroceryBag.intersect(roomatesGroceryBag)

// L 11.8 Detecting intersections in sets
let yourSecondBag = Set(["Berries", "Yogurt"])
let roommatesSecondBag = Set(["Grapes", "Honey"])
let disjoint = yourSecondBag.isDisjointWith(roommatesSecondBag)

// Bronze Challenge

let myCities = Set(["Atlanta", "Chicago", "Jacksonville", "New York", "San Francisco"])
let yourCities = Set(["Atlanta", "Chicago", "Jacksonville"])

let superset = myCities.isSupersetOf(yourCities)

// Silver Challenge

groceryBag.unionInPlace(friendsGroceryBag)
commonGroceryBag.intersectInPlace(roomatesGroceryBag)



