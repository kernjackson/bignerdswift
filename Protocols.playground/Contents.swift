//: Playground - noun: a place where people can play

import Cocoa

// L 19.1 Settings up the table
//func printTable(data: [[Int]]) {
//    for row in data {
//        // Create an empty string
//        var out = ""

// Append each item in this row to our string
//for item in row {
//    out += "\(item) |"
//}
//
//// Done - print it!
//print(out)
//}
//}
//
//let data = [
//    [30, 6],
//    [40, 18],
//    [50, 20],
//]


// L 19.2 Labeling the rows
func padding(amount: Int) -> String {
    var paddingString = ""
    for _ in 0 ..< amount {
        paddingString += " "
    }
    return paddingString
}

// L 19.14 Protocol Compositioin TabularDataSource should not be CustomStringConvertable
protocol TabularDataSource {
// L 19.12 Making TabularDataSource inherit from CustomString Convertable
//protocol TabularDataSource : CustomStringConvertible {
// L 19.5 Defining a Protocol
//protocol TabularDataSource {
    // this doesn't prevent set, it just requires getting for conformance
    var numberOfRows: Int { get }
    var numberOfColumns: Int { get }
    
    func labelForRow(row: Int) -> String
    func labelForColumn(column: Int) -> String
    
    func itemForRow(row: Int, column: Int) -> Int
}

//func printTable(rowLabels: [String], columnLabels: [String], data: [[Int]]) {
// L 19.8 Making printTqble(_:) take a TabularDataSource
//func printTable(dataSource: TabularDataSource) {
// L 19.15 Making printTable's argument conform to CustomStringConvertable
func printTable(dataSource: protocol<TabularDataSource, CustomStringConvertible>) {
    // 19.13
    print("Table: \(dataSource.description)")
    
    // Create arrays of the row and column labels
    let rowLabels = (0 ..< dataSource.numberOfRows).map { dataSource.labelForRow($0) }
    let columnLabels = (0 ..< dataSource.numberOfColumns).map {
        dataSource.labelForColumn($0)
    }

    // Create an array of the width of each row label
    let rowLabelWidths = rowLabels.map { $0.characters.count }
    
    // Determine length of longest row label
    guard let maxRowLabelWidth = rowLabelWidths.maxElement() else {
        return
    }
    
    // L 19.3 Labeling the columns
    
    // Create first row containing column headers
    var firstRow: String = padding(maxRowLabelWidth) + " |"
    
    // Also keep track of the width of each column
    var columnWidths = [Int]()
    
    for columnLabel in columnLabels {
        let columnHeader = " \(columnLabel) |"
        firstRow += columnHeader
        columnWidths.append(columnHeader.characters.count)
    }
    print(firstRow)
    
//    for (i, row) in data.enumerate() {
    for i in 0 ..< dataSource.numberOfRows {
        // Pad the row label out so they are all the same length
        let paddingAmount = maxRowLabelWidth - rowLabelWidths[i]
        var out = rowLabels[i] + padding(paddingAmount) + " |"
        
        // Append each item in this row to our string
//        for item in row {
//            out += "\(item) |"
//        }
        
        // 19.3
//        for (j, item) in row.enumerate() {
        // 19.8
        for j in 0 ..< dataSource.numberOfColumns {
            let item = dataSource.itemForRow(i, column: j)
            let itemString = " \(item) |"
            let paddingAmount = columnWidths[j] - itemString.characters.count
            out += padding(paddingAmount) + itemString
        }
        
        // Done - print it!
        print(out)
    }
}

// L 19.4 Using model objects
//let rowLabels = ["Joe", "Karen", "Fred"]
//let columnLabels = ["Age", "Years of Experience"]
//let data = [
//    [30, 6],
//    [40, 18],
//    [50, 20],
//]
//
//printTable(rowLabels, columnLabels:  columnLabels, data: data)

struct Person {
    let name: String
    let age: Int
    let yearsOfExperience: Int
}



// L 19.6 Declaring that Department conforms to TabularDataSource
struct Department: TabularDataSource {
    let name: String
    var people = [Person]()
    
    // 19.10 Conforming to CustomStringConvertable
    var description: String {
        return "Department (\(name)"
    }
    
    init(name: String) {
        self.name = name
    }
    
    mutating func addPerson(person: Person) {
        people.append(person)
    }
    
    var numberOfRows: Int {
        return people.count
    }
    
    var numberOfColumns: Int {
        return 2
    }
    
    func labelForRow(row: Int) -> String {
        return people[row].name
    }
    
    func labelForColumn(column: Int) -> String {
        switch column {
        case 0: return "Age"
        case 1: return "Years of Experience"
        default: fatalError("Invalid column")
        }
    }
    
    func itemForRow(row: Int, column: Int) -> Int {
        let person = people[row]
        switch column {
        case 0: return person.age
        case 1: return person.yearsOfExperience
        default: fatalError("Invalid column!")
        }
    }
    
}

var department = Department(name: "Engineering")
department.addPerson(Person(name: "Joe", age: 30, yearsOfExperience: 6))
department.addPerson(Person(name: "Karen", age: 40, yearsOfExperience: 18))
department.addPerson(Person(name: "Fred", age: 50, yearsOfExperience: 20))

// 19.9 Printing department
//printTable(department) // :( not sure how to call it now, and the book doesn't say
//printTable(TabularDataSource)
print(department)
// L 19.13 print(department)

// Mutating Methods
protocol Toggleable {
    mutating func toggle()
}

enum Lightbulb: Toggleable {
    case On
    case Off
    
    mutating func toggle() {
        switch self {
        case .On:
            self = .Off
        case .Off:
            self = .On
        }
    }
}

// Silver Challenge
printTable

// Gold Challenge

