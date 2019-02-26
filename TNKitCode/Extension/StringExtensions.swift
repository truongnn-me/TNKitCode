//
//  StringExtensions.swift
//  TNKitCode
//
//  Created by Truong Nguyen Nhut (Lazada Group) on 2/26/19.
//  Copyright © 2019 Truong Nguyen Nhut. All rights reserved.
//

import UIKit

extension String {
    
    func width(withConstrainedHeight height: Float, font: UIFont) -> Float {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: CGFloat(height))
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        return ceilf(Float(boundingBox.width))
    }
    
    func breakLineIndexForTwoLines() -> String.Index? {
        var moveIndex = index(startIndex, offsetBy: count/2)
        while moveIndex<endIndex && self[moveIndex] != " "  {
            moveIndex = index(moveIndex, offsetBy: 1)
        }
        if endIndex <= moveIndex {
            return nil
        }
        return moveIndex
    }
    
    func minimumWidthForTwoLines(withConstrainedHeight height: Float, font: UIFont) -> Float {
        if let breakLineIndex = self.breakLineIndexForTwoLines() {
            let string1 = String(self[startIndex..<breakLineIndex])
            let string2 = String(self[breakLineIndex..<endIndex])
            return max(string1.width(withConstrainedHeight: height, font: font), string2.width(withConstrainedHeight: height, font: font))
        }
        return self.width(withConstrainedHeight: height, font: font)
    }
    
}

