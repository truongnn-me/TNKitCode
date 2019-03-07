//
//  StringExtensions.swift
//  TNKitCode
//
//  Created by Truong Nguyen Nhut (Lazada Group) on 2/26/19.
//  Copyright © 2019 Truong Nguyen Nhut. All rights reserved.
//

import UIKit

public extension String {
    func checkReg(regString: String) -> Bool {
        let range = NSRange(location: 0, length: self.count)
        do {
            let reg = try NSRegularExpression(pattern: regString, options: .caseInsensitive)
            if let _ = reg.firstMatch(in: self, options: NSRegularExpression.MatchingOptions.reportCompletion, range: range) {
                return true
            }
        } catch {
            return false
        }
        return false
    }
        
    /**
     Return the minimum width for display text in 1 line
     */
    func minimumWidthForDisplayInOneLine(withConstrainedHeight height: Float, font: UIFont) -> Float {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: CGFloat(height))
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        return ceilf(Float(boundingBox.width))
    }
    
    /**
     Find the space's index for break the text in 2 lines
     Ex: let test = "abcde 7890". Return Index at 5
     */
    func breakLineIndexForTwoLines() -> String.Index? {
        let moveIndex = index(startIndex, offsetBy: count/2)
        if validIndex(index: moveIndex) {
            if self[moveIndex] == " " {
                return moveIndex
            } else {
                if let breaklineIndex1 = move(toString: " ", fromIndex: moveIndex, moveForward: true) {
                    return breaklineIndex1
                }
                if let breaklineIndex2 = move(toString: " ", fromIndex: moveIndex, moveForward: false) {
                    return breaklineIndex2
                }
            }
        }
        return nil
    }
    
    /**
     Minimum width for display texts in 2 lines
     */
    func minimumWidthForTwoLines(withConstrainedHeight height: Float, font: UIFont) -> Float {
        if let breakLineIndex = self.breakLineIndexForTwoLines() {
            let string1 = String(self[startIndex..<breakLineIndex])
            let string2 = String(self[breakLineIndex..<endIndex])
            return max(string1.minimumWidthForDisplayInOneLine(withConstrainedHeight: height, font: font),
                       string2.minimumWidthForDisplayInOneLine(withConstrainedHeight: height, font: font))
        }
        return self.minimumWidthForDisplayInOneLine(withConstrainedHeight: height, font: font)
    }
    
    /**
     Create a string with defined length and prefix
     If cannot find the string with length defined, it will try to get the string which has length near this defined value.
     - Parameters:
        - length: length of returned string
        - prefix: prefix for returned string. Its length is also counted in defined length
     - Returns:
        - The string returned will have defined length and prefix. Can be nil.
     */
    func string(length: Int, prefix: String) -> String? {
        var result: String?
        if count > 0 {
            if count + prefix.count <= length {
                result = prefix + self
                return result
            }
            if let sliceIndex = index(startIndex, offsetBy: length - prefix.count, limitedBy: endIndex) {
                if self[sliceIndex] != " " {
                    //Move index until can reach the space
                    if let moveIndex = move(toString: " ", fromIndex: sliceIndex, moveForward: false) {
                        let stringSplit = String(self[startIndex..<moveIndex])
                        
                        result = prefix + stringSplit
                    }
                } else {
                    let stringSplit = String(self[startIndex..<sliceIndex])
                    result = prefix + stringSplit
                }
            } else {
                let stringSplit = String(self[startIndex..<endIndex])
                result = prefix + stringSplit
            }
        }
        return result
    }
    
    /**
    Check if the index in range startIndex..<endIndex
    */
    func validIndex(index: String.Index) -> Bool {
        return index >= startIndex && index < endIndex
    }
    
    /**
    Return toString's Index from fromIndex. The direction can be forward/backward
    */
    func move(toString string: String, fromIndex: String.Index, moveForward: Bool) -> String.Index? {
        if fromIndex >= startIndex && fromIndex <= endIndex {
            let offset = moveForward ? 1 : -1
            let limitedIndex = moveForward ? endIndex : startIndex
            var moveIndexStart = fromIndex
            while let moveIndex = index(moveIndexStart, offsetBy: offset, limitedBy: limitedIndex) {
                if moveIndex != limitedIndex {
                    if String(self[moveIndex]) == string {
                        return moveIndex
                    }
                }
                moveIndexStart = moveIndex
            }
        }
        return nil
    }
    
}

