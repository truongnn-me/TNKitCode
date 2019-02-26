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
    func testStringCannotBreakline() {
        let testString = "12345"
        let result = testString.breakLineIndexForTwoLines()
        XCTAssertNil(result)
    }
    
    func testBreakline() {
        let testString = "123 45"
        if let result = testString.breakLineIndexForTwoLines() {
            let string1 = String(testString[testString.startIndex..<result])
            let string2 = String(testString[result..<testString.endIndex])
            XCTAssert(string1 == "123", "")
            XCTAssert(string2 == " 45", "")
        } else {
            XCTFail()
        }
    }
    
    func testMidleIndexIsNonspaceCharacter() {
        let testString = "1234 45"
        if let result = testString.breakLineIndexForTwoLines() {
            let string1 = String(testString[testString.startIndex..<result])
            let string2 = String(testString[result..<testString.endIndex])
            XCTAssert(string1 == "1234", "string1 should be 1234")
            XCTAssert(string2 == " 45", "string2 should be ' 45'")
        } else {
            XCTFail()
        }
    }
    
    func testMidleIndexInEmptyString() {
        let testString = ""
        let result = testString.breakLineIndexForTwoLines()
        XCTAssertNil(result)
    }
    
    func testMinimumWidthForText() {
        let testString = "12345"
        let font = UIFont.systemFont(ofSize: 14)
        let expected = Float(41)//Get this number in UILabel from Xib file or storyboard
        let result = testString.minimumWidthForTwoLines(withConstrainedHeight: 34, font: font)
        XCTAssertEqual(expected, result)
        
    }
}
