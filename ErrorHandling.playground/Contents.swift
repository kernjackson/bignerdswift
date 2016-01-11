//: Playground - noun: a place where people can play

import Cocoa

// ## Lexing and Input String

// L 20.1 Declaring a Token type
enum Token {
    case Number(Int)
    case Plus
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
    
    // L 20.6 Declaring the trhowing lex() method
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

// L 20.10 Evaluating the lexer
func evaluate(input: String) {
    print("Evaluating: \(input)")
    let lexer = Lexer(input: input)
    do {
        let tokens = try lexer.lex()
        print("Lexer output: \(tokens)")
        // L 20.12 Catching an Invalid Character error
    } catch Lexer.Error.InvalidCharacter(let character) {
        print("Input contained an invalid character: \(character)")
    } catch {
        print("An error occurred: \(error)")
    }
}

evaluate("10 + 3 + 5")
evaluate("1 + 2 + abcdefg")

