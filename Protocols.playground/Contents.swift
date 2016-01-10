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

func printTable(rowLabels: [String], columnLabels: [String], data: [[Int]]) {

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
    
    for (i, row) in data.enumerate() {
        // Pad the row label out so they are all the same length
        let paddingAmount = maxRowLabelWidth - rowLabelWidths[i]
        var out = rowLabels[i] + padding(paddingAmount) + " |"
        
        // Append each item in this row to our string
//        for item in row {
//            out += "\(item) |"
//        }
        
        // 19.3
        for (j, item) in row.enumerate() {
            let itemString = " \(item) |"
            let paddingAmount = columnWidths[j] - itemString.characters.count
            out += padding(paddingAmount) + itemString
        }
        
        // Done - print it!
        print(out)
    }
}

let rowLabels = ["Joe", "Karen", "Fred"]
let columnLabels = ["Age", "Years of Experience"]
let data = [
    [30, 6],
    [40, 18],
    [50, 20],
]

printTable(rowLabels, columnLabels:  columnLabels, data: data)



