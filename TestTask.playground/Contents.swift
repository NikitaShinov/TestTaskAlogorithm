import Foundation
import XCTest

//:MARK: - Условие:
/*
 Реализовать алгоритм, который сжимает строку по повторяющимся символам:
 "aaaaabbbbbbbbcd" ->"a5b8c1d1"
 "abcaaaaaaaaaaaaaaaaaabbc" -> "a1b1c1a18b2c1"
 В случае, если сжатая строка длиннее, чем исходная ("ab" -> "a1b1") - необходимо вернуть исходную строку.
 Нужно реализовать этот алгоритм.
 */

//MARK: - Реализация:

func removeDuplicatesInString(inputString: String) -> String {
    
    guard !inputString.isEmpty else { return "Ошибка ввода, строка пустая."}

    let convertedArray = Array(inputString)
    var counter = 0
    var previousChar : Character = convertedArray[0]
    var stringToReturn = ""

    for (_, currentChar) in convertedArray.enumerated() {
        
        if previousChar == currentChar {
            
            counter += 1
            
        } else {
            
            stringToReturn = stringToReturn + previousChar.description + counter.description
            counter = 1
            
        }
        
        previousChar = currentChar
    }
    
    stringToReturn = stringToReturn + previousChar.description + counter.description
    
    return stringToReturn.count > inputString.count ? inputString : stringToReturn
}

//MARK: - Тесты:

class TestTaskTests: XCTestCase {
    
    func testOne() {
        let inputOne = "aaaaabbbbbbbbcd"
        let result = removeDuplicatesInString(inputString: inputOne)
        XCTAssertEqual(result, "a5b8c1d1")
    }
    
    func testTwo() {
        let inputOne = "abcaaaaaaaaaaaaaaaaaabbc"
        let result = removeDuplicatesInString(inputString: inputOne)
        XCTAssertEqual(result, "a1b1c1a18b2c1")
    }
    
    func testThree() {
        let inputOne = "ab"
        let result = removeDuplicatesInString(inputString: inputOne)
        XCTAssertEqual(result, "ab")
    }
}

TestTaskTests.defaultTestSuite.run()
