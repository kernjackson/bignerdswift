//: Playground - noun: a place where people can play

import Cocoa

// ## Generic Data Structures

// L 22.1 Settings up a Stack
// L 22.3 Making Stack generic
struct Stack<Element> {
    var items = [Element]()
    
    mutating func push(newItem: Element) {
        items.append(newItem)
    }
    
    mutating func pop() -> Element? {
        guard !items.isEmpty else {
            return nil
        }
        return items.removeLast()
    }
    
    // L 22.8 Mapping on a Stack
    func map<U>(f: Element -> U) -> Stack<U> {
        var mappedItems = [U]()
        for item in items {
            mappedItems.append(f(item))
        }
        return Stack<U>(items: mappedItems)
    }
}

// L 22.2 Creating an instance of Stack
// L 22.4 Specializing intStack
var intStack = Stack<Int>()
intStack.push(1)
intStack.push(2)

print(intStack.pop()) // Prints Optional(2)
print(intStack.pop()) // Prints Optional(1)
print(intStack.pop()) // Prints nil

// L 22.9 Using map
var doubleStack = intStack.map({ 2 * $0 })
print(doubleStack.pop()) // Prints Optional(4)
print(doubleStack.pop()) // Prints Optional(2)

// L 22.5 Creating a Stack of strings
var stringStack = Stack<String>()
stringStack.push("this is a string")
stringStack.push("another string")

print(stringStack.pop()) // Prints Optional("another string")

// ## Generic Functions and Methods

// L 22.6 You own map function
func myMap<T,U>(items: [T], f: (T) -> (U)) -> [U] {
    var result = [U]()
    for item in items {
        result.append(f(item))
    }
    return result
}

// L 22.7 Mapping arrays
let strings = ["one", "two", "three"]
let stringLengths = myMap(strings) { $0.characters.count }
print(stringLengths) // Prints [3, 3, 5]

// L 22.10 Using a type constraint to alllow checking for equality
func checkIfEqual<T: Equatable>(first: T, _ second: T) -> Bool {
    return first == second
}

print(checkIfEqual(1, 1))
print(checkIfEqual("a string", "a string"))
print(checkIfEqual("a string", "a different string"))

// L 22.11 Using atype constraint to check CustomStringConvertable
func checkIfDescriptionsMatch<T: CustomStringConvertible, U: CustomStringConvertible>(first: T, _ second: U) -> Bool {
    return first.description == second.description
}

print(checkIfDescriptionsMatch(Int(1), UInt(1)))
print(checkIfDescriptionsMatch(1, 1.0))
print(checkIfDescriptionsMatch(Float(1.0), Double(1.0)))


