//: For the More Curious: Function Currying

// Function currying allows you to rewrite an existing function that take multiple parameters as a new function that takes one parameter and returns another function. The rewritten function is called a curried function

// L 15.18 
func greetName(name: String, withGreeting greeting: String) -> String {
    return "\(greeting) \(name)"
}

let personalGreeting = greetName("Matt", withGreeting: "Hello")
print(personalGreeting)

// 15.20 Function Currying
func greetingForName(name: String) -> (String) -> String {
    func greeting(greeting: String) -> String {
        return "\(greeting) \(name))"
    }
    return greeting
}

// L 15.21 Using the curried function
let greeterFunction = greetingForName("Matt")
let theGreeting = greeterFunction("Hello")
print(theGreeting)

// 15.22 A more concise curried function
func greeting(greeting: String)(name: String) -> String {
    return "\(greeting) \(name)"
}

let friendlyGreeting = greeting("Hello,")
let newGreeting = friendlyGreeting(name: "Matt")
print(newGreeting)

// L 15.23 Creating a Person
struct Person {
    var firstName = "Matt"
    var lastName = "Mathias"
    
    mutating func changeName(fn: String, ln: String) {
        firstName = fn
        lastName = ln
    }
}

// L 15.24 Create a new instance of Person
var p = Person()

// L 15.25 Instance methods are curried functions
let changer = Person.changeName

// L 15.26 changer in action
changer(&p)("John", ln: "Gallagher")
p.firstName // John

// L 15.27 Using changeName(_:ln:) instead of changer is a good idea
p.changeName("John", ln: "Gallagher")
p.firstName
