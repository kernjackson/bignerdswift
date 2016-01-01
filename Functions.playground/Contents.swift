//: 12 Functions

// L 12.1 Defining a function
func printGreeting() {
    print("Hello, playground.")
}
printGreeting()

// L 12.2 Using a parameter
func printPersonalGreeting(name: String) {
    print("Helloe \(name), welcome to your playground.")
}
printPersonalGreeting("Matt")

// L 12.3 A function for division
func oldDivisionDescription(num: Double, den: Double) {
    print("\(num) divided by \(den) equals \(num / den)")
}
oldDivisionDescription(9.0, den: 3.0)

// L 12.4 using explicit parameter names
func divisionDescription(forNumerator num: Double, andDenomiator den: Double) {
    print("\(num) divided by \(den) equals \(num / den)")
}
divisionDescription(forNumerator: 9.0, andDenomiator: 3.0)

// L 12.5 Variadic parameters
func printPersonalGreetings(names: String...) {
    for name in names {
        print("Hello \(name), welcome to the playground.")
    }
}
printPersonalGreetings("Alex", "Chris", "Drew", "Pat")

// L 12.6
func defaultParam(forNuemrator num: Double, andDenominator den: Double, withPunctuation punctuation: String = ".") {
    defaultParam(forNuemrator: 9.0, andDenominator: 3.0)
    defaultParam(forNuemrator: 9.0, andDenominator: 3.0, withPunctuation: "!")
}

// L 12.7 In-Out parameter
var error = "The request failed:"
func appendErrorCode(code: Int, inout toErrorString errorString: String) {
    if code == 400 {
        errorString += " bad request."
    }
}
appendErrorCode(400, toErrorString: &error)
error

// 12.8 Returning from a function
func returnDivisionDescription(
    forNumerator num: Double,
    andDenominator den: Double,
    withPunctuation punctuation: String = ".") -> String {
        return ("\(num) divided by \(den) equals \(num / den)")
}
print(returnDivisionDescription(forNumerator: 9.0, andDenominator: 3.0))
print(returnDivisionDescription(forNumerator: 9.0, andDenominator: 3.0, withPunctuation: "!"))

// 12.9 Nested functions
func areaOfTriangle(withBase base: Double, andHeight height: Double) -> Double {
    let numerator = base * height
    func divide() -> Double {
        return numerator / 2
    }
    return divide()
}
areaOfTriangle(withBase: 3.0, andHeight: 5.0)

// L 12.10 Sorting evens and odds
func sortEvenOdd(numbers: [Int]) -> (evens: [Int], odds: [Int]) {
    var evens = [Int]()
    var odds = [Int]()
    for number in numbers {
        if number % 2 == 0 {
            evens.append(number)
        } else {
            odds.append(number)
        }
    }
    return (evens, odds)
}

// L 12.11 Calling above func
let aBunchOfNumbers = [10,1,4,3,57,43,84,27,156,111]
let theSortedNumbers = sortEvenOdd(aBunchOfNumbers)
print("The even numbers are: \(theSortedNumbers.evens); the odd numbers are: \(theSortedNumbers.odds)")

// L 12.12 Using an optional return
func grabMiddleName(name: (String, String?, String)) -> String? {
    return name.1
}

let middleName = grabMiddleName(("Matt", nil, "Mathias"))
if let theName = middleName {
    print(theName)
}

// L 12.13 Early exists with guard statements
func greetByMiddleName(name: (first: String, middle: String?, last: String)) {
    guard let middleName = name.middle else {
        print("Hey there!")
        return
    }
    print("Hey \(middleName)")
}
greetByMiddleName(("Matt", "Danger", "Mathias"))

// Bronze Challenge
func newGreetByMiddleName(name: (first: String, middle: String?, last: String)) {
    guard let middleName = name.middle where name.middle?.characters.count < 4 else {
        print("Hey there!")
        return
    }
    print("Hey \(middleName)")
}
newGreetByMiddleName(("Matt", "Dan", "Mathias"))

// Silver Challenge
func beanSifter(groceryList groceryList: [String]) -> (beans: [String], otherGroceries: [String]) {
    
    var beans: [String] = []
    var otherGroceries: [String] = []
    
    
    
    for item in groceryList {
//        guard beans.append(item) where item.hasSuffix("beans") else {
//            print("asdf")
//            return
//        }
        if item.hasSuffix("beans") {
            beans.append(item)
        } else {
            otherGroceries.append(item)
        }
    }
    return (beans, otherGroceries)
}

let result = beanSifter(groceryList: [
    "green beans",
    "milk",
    "black beans",
    "pinto beans",
    "apples"
    ])

result.beans == ["green beans", "black beans", "pinto beans"]
result.otherGroceries == ["milk", "apples"]

















