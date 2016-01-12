//: Playground - noun: a place where people can play

import Cocoa

// ## Lexing and Input String

// L 20.1 Declaring a Token type
enum Token {
    case Number(Int)
    case Plus
    case Minus
}

// L 20.2  Creating a Lexer
class Lexer {
    
    // L 20.7 Declaring Lexer .Error
    enum Error: ErrorType {
        case InvalidCharacter(Character)
    }
    
    let input: String.CharacterView
    var position: String.CharacterView.Index
    
    init(input: String) {
        self.input = input.characters
        self.position = self.input.startIndex
    }

    // L 20.3 Implementing peek()
    func peek() -> Character? {
        guard position < input.endIndex else {
            return nil
        }
    return input[position]
    }
    
    func advance() {
        // L 20.5 Adding an assertion to advance()
        assert(position < input.endIndex, "Cannot advance past the end!")
        ++position
    }
    
    // L 20.6 Declaring the throwing lex() method
    func lex() throws -> [Token] {
        var tokens = [Token]()
        
        while let nextCharacter = peek() {
            switch nextCharacter {
            case "0" ... "9":
            // Start of a number - need to grab the rest
                // L 20.9 Implementing Lexer.getNumber()
                let value = getNumber()
                tokens.append(.Number(value))
            case "+":
            tokens.append(.Plus)
                advance()
            case "-":
                tokens.append(.Minus)
                advance()
            case " ":
            // Just advance to ignore spaces
                advance()
            default:
                // Something unexpected - need to send back an error
                // L 20.8 Throwing an error
                throw Error.InvalidCharacter(nextCharacter)
            }
        }
        return tokens
    }
    
    // L 20.9 Implementing Lexer.getNumber()
    func getNumber() -> Int {
        var value = 0
        
        while let nextCharacter = peek() {
            switch nextCharacter {
                case "0" ... "9":
                // Another digit - add it into value
                let digitValue = Int(String(nextCharacter))!
                value = 10*value + digitValue
                advance()
                
            default:
                // A non-digit - go back to regular lexing
                return value
            }
        }
        return value
    }
    
    
}


// ## Parsing the Token Array

// L 20.14 Beginning the implementation Parser
class Parser {
    enum Error: ErrorType {
        // L 20.15 Defining possible Parser errors
        case UnexpectedEndOfInput
        case InvalidToken(Token)
    }
    
    let tokens: [Token]
    var position = 0
    
    init(tokens: [Token]) {
        self.tokens = tokens
    }
    
    func getNextToken() -> Token? {
        guard position < tokens.count else {
            return nil
        }
        return tokens[position++]
    }
    
    // L 20.16 Implementing Parser.getNumber()
    func getNumber() throws -> Int {
        guard let token = getNextToken() else {
            throw Error.UnexpectedEndOfInput
        }
        
        switch token {
        case .Number(let value):
            return value
        case .Plus, .Minus:
            throw Error.InvalidToken(token)
        }
    }
    
    // L 20.17 Implementing Parser.parse()
    func parse() throws -> Int {
        // Require a number first
        var value = try getNumber()
        
        while let token = getNextToken() {
            switch token {
                
                // Getting a Plus after a Number is legal
            case .Plus:
                // After a plus, we must get another number
                let nextNumber = try getNumber()
                value += nextNumber
            
            case .Minus:
                // Bronze Challenge
                let nextNumber = try getNumber()
                value -= nextNumber
                
                // Getting a Number after a Number is not legal
            case .Number:
                throw Error.InvalidToken(token)
            }
        }
        return value
    }
        
        
}

// L 20.10 Evaluating the lexer
func evaluate(input: String) {
    print("Evaluating: \(input)")
    let lexer = Lexer(input: input)
//    let tokens = try! lexer.lex()
    // L 20.22 Using try? in evaluate(_:)
//    guard let tokens = try? lexer.lex() else {
//        print("Lexing failed, but I don't know why")
//        return
//    }
    
    do {
        let tokens = try lexer.lex()
        print("Lexer output: \(tokens)")
        
        // L 20.18 Updating evaluate(_:) to use Parser
        let parser = Parser(tokens: tokens)
        let result = try parser.parse()
        print("Parser output: \(result)")
        
        // L 20.12 Catching an Invalid Character error
    } catch Lexer.Error.InvalidCharacter(let character) {
        print("Input contained an invalid character at index \(index): \(character) ")
    } catch Parser.Error.UnexpectedEndOfInput {
        print("Unexpected end of input during parsing")
    } catch Parser.Error.InvalidToken(let token) {
        print("Invalid token during parsing: \(token)")
    } catch {
        // L 20.24 Avoid handling unkown ErrorTypes in evaluate(_:)
        print("An error occurred: \(error)")
    }
}

evaluate("10 + 3 + 5")
// L 20.13 Removing bad input
evaluate("1 + 2 + abcdefg")

// Bronze Challenge
evaluate("10 + 5 - 3 - 1")

// Silver Challenge
evaluate("1 + 3 + 7a + 8")
evaluate("10 + 3 3 + 7")

// Gold Challenge
evaluate("10 * 3 + 5 * 3") // 45
evaluate("10 + 3 * 5 + 3") // 28
evaluate("10 + 3 * 5 * 3") // 55



