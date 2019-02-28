//
//  TNStringTests.swift
//  TNKitCodeTests
//
//  Created by Truong Nguyen Nhut (Lazada Group) on 2/26/19.
//  Copyright © 2019 Truong Nguyen Nhut. All rights reserved.
//

import UIKit
import XCTest

@testable import TNKitCode

class TNStringTests: XCTestCase {
    func test_breakLineIndexForTwoLines_whenCannotFindIndexForBreakline_ShouldReturnNil() {
        let testString = "12345"
        let result = testString.breakLineIndexForTwoLines()
        XCTAssertNil(result)
    }
    
    func test_breakLineIndexForTwoLines_whenCanFindTheIndexForBreakline_shouldReturnTheIndex() {
        var sub1 = "123"
        var sub2 = " 45"
        checkBreakLineIndexForTwoLines(sub1: sub1, sub2: sub2)
        sub1 = "a"
        sub2 = " bcdefghijk"
        checkBreakLineIndexForTwoLines(sub1: sub1, sub2: sub2)
        sub1 = "1234"
        sub2 = " 45"
        checkBreakLineIndexForTwoLines(sub1: sub1, sub2: sub2)
    }
    
    func checkBreakLineIndexForTwoLines(sub1: String, sub2: String) -> Void {
        let testString = sub1 + sub2
        if let result = testString.breakLineIndexForTwoLines() {
            let string1 = String(testString[testString.startIndex..<result])
            let string2 = String(testString[result..<testString.endIndex])
            XCTAssert(string1 == sub1, "")
            XCTAssert(string2 == sub2, "")
        } else {
            XCTFail()
        }
    }
    
    func test_breakLineIndexForTwoLines_whenStringIsEmpty_shouldReturnNil() {
        let testString = ""
        let result = testString.breakLineIndexForTwoLines()
        XCTAssertNil(result)
    }
    
    func test_minimumWidthForDisplayInOneLine() {
        let testString = "12345"
        let font = UIFont.systemFont(ofSize: 14)
        let expected = Float(41)//Get this number in UILabel from Xib file or storyboard
        let result = testString.minimumWidthForTwoLines(withConstrainedHeight: 34, font: font)
        XCTAssertEqual(expected, result)
    }
    
    //MARK: test move method
    func test_move_whenStringIsEmpty_shouldReturnNil() {
        let testString = ""
        let moveIndex1 = testString.move(toString: "a", fromIndex: testString.startIndex, moveForward: true)
        XCTAssertNil(moveIndex1)
        let moveIndex2 = testString.move(toString: "a", fromIndex: testString.startIndex, moveForward: false)
        XCTAssertNil(moveIndex2)
    }
    
    func test_move_whenCannotFindIndex_shouldReturnNil() {
        let testString = "a bc bd df hg gg"
        let moveIndex1 = testString.move(toString: "a", fromIndex: testString.startIndex, moveForward: true)
        XCTAssertNil(moveIndex1)
        
        let moveIndex2 = testString.move(toString: "a", fromIndex: testString.startIndex, moveForward: false)
        XCTAssertNil(moveIndex2)
    }
    
    func test_move_whenCanFindIndex_shouldReturnIndexAtString() {
        let testString = "abcs3fvfkjvbkfjfkg"
        let findString = "g"
        if let moveIndex = testString.move(toString: findString, fromIndex: testString.startIndex, moveForward: true) {
            let string = String(testString[moveIndex])
            XCTAssertEqual(string, findString)
        } else {
            XCTFail()
        }
        let moveIndex = testString.move(toString: findString, fromIndex: testString.startIndex, moveForward: false)
        XCTAssertNil(moveIndex)
    }
    
    func test_move_whenInvalidFromIndex_shouldReturnNil() {
        let tempString = "1234567890"
        let fromIndex = tempString.index(tempString.startIndex, offsetBy: 8)
        let testString = "agbcs3"
        let findString = "g"
        let result1 = testString.move(toString: findString, fromIndex: fromIndex, moveForward: true)
        let result2 = testString.move(toString: findString, fromIndex: fromIndex, moveForward: false)
        XCTAssertNil(result1)
        XCTAssertNil(result2)
    }
    //MARK: test string method
    func test_string_withEmptyString_shouldReturnNil() {
        let testString = ""
        let result = testString.string(length: 10, prefix: "abc")
        XCTAssertNil(result)
    }
    
    func test_string_withHasLengthLessThanDefinedLength_shouldStringWithPrefixInLength() {
        let testString = "a b c d e f g h"
        let result = testString.string(length: 20, prefix: "abc")
        let expected = "abca b c d e f g h"
        XCTAssertEqual(result, expected)
    }
    
    func test_string_whenSliceIndexIsSpace_shouldReturnStringWithPrefixInLength() {
        let testString = "a bc bd df hg gg"
        let prefix = "###"
        let expected = prefix + "a bc bd"
        let result = testString.string(length: 10, prefix: prefix)
        XCTAssertTrue(result == expected)
    }
    
    func test_string_whenSliceIndexIsNotSpace_shouldReturnStringWithPrefixNearestDefinedLength() {
        let testString = "a bc bddf hg gg"
        let prefix = "###"
        let expected = prefix + "a bc"
        let result = testString.string(length: 10, prefix: prefix)
        XCTAssertTrue(result == expected)
    }
    
    func test_string_withValidLengthAndPrefix_shouldReturnStringWithPrefixInLength() {
        let testString = "a b c d s e w d f 1 23 4"
        let result = testString.string(length: 5, prefix: "abc")
        let expected = "abca"
        XCTAssertEqual(result, expected)
    }
    
    func test_string_withEmptyPrefixAndValidLength_shouldReturnStringWithEmptyPrefixAndLength() {
        let testString = "a b c d s e w d f 1 23 4"
        let result = testString.string(length: 5, prefix: "")
        let expected = "a b c"
        XCTAssertEqual(result, expected)
    }
    
    func test_string_withDefinedLengthGreaterThanLengthOfString_shouldReturnNil() {
        let testString = "a b c d s e w d f 1 23 4"
        let prefix = "abc"
        let result = testString.string(length: 50, prefix: prefix)
        let expected = prefix + testString
        XCTAssertEqual(expected, result)
    }
    
    func test_string_withContainsWordExceedLength_shouldReturnNil() {
        let testString = "abcdefgqwrrrnkvfnkvnfknfdnd"
        let result = testString.string(length: 10, prefix: "ss")
        XCTAssertNil(result)
    }
    
}
