//: 14 Enumerations

// L 14.1 Defining an enumeration
enum TextAlignment {
    case Left
    case Right
    case Center
    case Justify
}

// L 14.2...5 Create an instance
//var alignment: TextAlignment = TextAlignment.Left
var alignment = TextAlignment.Justify
alignment = .Right

if alignment == .Right {
    print("we should right-align the text!")
}

// L 14.6. Switching to switch
switch alignment {
case .Left:
    print("left aligned")
case .Right:
    print("right aligned")
case .Center:
    print("center aligned")
case .Justify:
    print("justified")
}

// L 14.7...9 Default case (not recommended when switching on enum types)
switch alignment {
case .Left:
    print("left aligned")
case .Right:
    print("right aligned")
    // default here makes it print the wrong thing when you add another case
default:
    print("center aligned")
}

// L 14.11 Raw value enumerations
enum TextAlignment2: Int {
    case Left
    case Right
    case Center
    case Justify
}

print(TextAlignment2.Left.rawValue)
print(TextAlignment2.Right.rawValue)
print(TextAlignment2.Center.rawValue)
print(TextAlignment2.Justify.rawValue)

// L 14.13 Specifying raw values
enum TextAlignment3: Int {
    case Left       = 20
    case Right      = 30
    case Center     = 40
    case Justify    = 50
}

print(TextAlignment3.Left.rawValue)
print(TextAlignment3.Right.rawValue)
print(TextAlignment3.Center.rawValue)
print(TextAlignment3.Justify.rawValue)

// L 14.14 Converting raw values to enum types
// Create a raw value
let myRawValue = 20

// Try to convert the raw value into a TextAlignment
if let myAlignment = TextAlignment3(rawValue: myRawValue) {
    // Conversion succeeded!
    print("successfully converted \(myRawValue) into a TextAlignment")
} else {
    // Conversion failed
    print("\(myRawValue) has no corresponding TextAlignment case")
}

// L 14.15 try a bad value
// let myRawValue = 100

// L 14.16 Creating an enum with strings
enum ProgrammingLanguages: String {
    case Swift      //= "Swift"
    case ObjectiveC = "Objective-C"
    case Cpp        = "C++"
    case Java       //= "Java"
}
let myFavoriteLanauge = ProgrammingLanguages.Swift
print("This book is about: \(myFavoriteLanauge)")

// L 14.17 if you don't specify a value it will just use the name!

// ## Methods - a method is a function that is associated with a type
// In many languages methods can only be associated with classes...
// In Swift, methods can also be associated with enums

// L 14.18 
enum Lightbulb {
    case On
    case Off
    
    func surfaceTemperatureForAmbientTemperature(ambient: Double) -> Double {
        switch self {
        case .On:
            return ambient + 150.0
        case .Off:
            return ambient
        }
    }
    
    // L 14.21 toggle
    mutating func toggle() { // value types can't make changes unless specified here
        switch self {
        case .On:
            self = .Off
        case .Off:
            self = .On
        }
    }
}

// L 14.20 Turning on the light
var bulb = Lightbulb.On
let ambientTemperature = 77.0

var bulbTemperature = bulb.surfaceTemperatureForAmbientTemperature(ambientTemperature)
print("bulb temp is: \(bulbTemperature)")

bulb.toggle()
var bulbTemperature2 = bulb.surfaceTemperatureForAmbientTemperature(ambientTemperature)
print("bulb temp is: \(bulbTemperature2)")

// L 14.24 Associated values
enum ShapeDimensions {
    // L 14.28 Point has no associated value - it is dimensionless
    case Point
    
    // Square's associated value is the length of one side
    case Square(Double)
    
    // Rectangle's associated value defines its width and height
    case Rectangle(width: Double, height: Double)
    
    // Silver Challenge
    case RightTriangle(base: Double, height: Double, hypotenuse: Double)
    
    // L 14.26 Using a switch statement to unpack associated values
    func area() -> Double {
        switch self {
        case .Point:
            return 0
        case let .Square(side):
            return side * side
        case let .Rectangle(width: w, height: h):
            return w * h
        case let .RightTriangle(base: base, height, _):
            return (base * height) / 2
        }
    }
    
    func perimeter() -> Double {
        switch self {
        case .Point:
            return 0
        case let .Square(side):
            return side * 4
        case let .Rectangle(width: w, height: h):
            return w + w + h + h
        case let .RightTriangle(base: base, height, hypotenuse):
            return base + height + hypotenuse
        }
    }
}

// L 14.25 Creating shapes
var squareShape = ShapeDimensions.Square(10.0)
var rectangleShape = ShapeDimensions.Rectangle(width: 5.0, height: 10.0)

// L 14.27 Computing areas
print("square's area = \(squareShape.area())")
print("rectangle's area = \(rectangleShape.area())")

// L 14.29 what is the area of a point
var pointShape = ShapeDimensions.Point
print("point's area = \(pointShape.area())")

// L 14.30...2 Recursive Enumarations - indirect points to FamilyTree
enum FamilyTree {
//indirect enum FamilyTree {
    case NoKnownParents
    indirect case OneKnownParent(name: String, ancestors: FamilyTree)
    indirect case TwoKnownParents(fatherName: String, fatherAncestors: FamilyTree, motherName: String, motherAncestors: FamilyTree)
}

// L 14.33 Good for nested information
let fredAncestors = FamilyTree.TwoKnownParents(
    fatherName: "Fred Sr.",
    fatherAncestors: .OneKnownParent(name: "Beth", ancestors: .NoKnownParents),
    motherName: "Marhsa",
    motherAncestors: .NoKnownParents)

// Bronze Challenge
print("square's perimeter = \(squareShape.perimeter())")
print("rectangle's area = \(rectangleShape.perimeter())")
print("point's area = \(pointShape.perimeter())")

// Silver Challenge
var rightTriangleShape = ShapeDimensions.RightTriangle(base: 4, height: 3, hypotenuse: 5)
print("right triangle's area = \(rightTriangleShape.area())")
print("right triangle's perimeter = \(rightTriangleShape.perimeter())")











