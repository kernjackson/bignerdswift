//: Playground - noun: a place where people can play

import UIKit

// L 9.1, 9.2, 9.3, 9.4 Creating and initializing an array
var otherList: Array<String>
//var bucketList: [String] = ["Climb Mt. Everest"]
// we can use type inference when we initialize inline
var bucketList = ["Climb Mt. Everest"]

// L 9.5 Hot air balloon adventure
bucketList.append("Fly hot air balloon to Fiji")

// L 9.6 So many ambitions!
bucketList.append("Watch the Lord of the Rings trilogy in one day")
bucketList.append("Stop typing in these fake goals")
bucketList.append("Go on a walkabout")

// L 9.7 Removing an item form the array
bucketList.removeAtIndex(2)
bucketList

// L 9.8 Counting items in an Array
bucketList.count

// L 9.9 Subscripting to find a range of items
print(bucketList[1...2])

// L 9.10 Use subscripting to append new information
bucketList[2] += " in Australia"
bucketList

// L 9.11 Replacing an array item
bucketList[0] = "Climb Mt. Kilimanjaro"

// L 9.12 Use a loop to append new items
var newItems = [
    "Learn Swift",
    "Finish Chapter 9",
    "Celebrate the new year"
]

//for item in newItems {
//    bucketList.append(item)
//}

// L 9.13
bucketList += newItems

bucketList.count

// L 9.14 Inserting a new item
bucketList.insert("Tobogan across Alaksa", atIndex: 2)

// ## Bronze Challenge

var toDoList = ["1", "2", "3", "5", "4"]
toDoList.isEmpty

// ## Silver Challenge

var invertedList = toDoList.sort()
print(invertedList.reverse())

for i in (1...5).reverse() {
    i
}


