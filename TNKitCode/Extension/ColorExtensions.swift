//
//  ColorExtensions.swift
//  TNKitCode
//
//  Created by Truong Nguyen on 8/10/19.
//  Copyright © 2019 Truong Nguyen Nhut. All rights reserved.
//

import UIKit

extension UIColor {
    static func random() -> UIColor {
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
