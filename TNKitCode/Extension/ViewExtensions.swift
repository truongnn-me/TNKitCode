//
//  ViewExtensions.swift
//  TNKitCode
//
//  Created by Truong Nguyen Nhut (Lazada Group) on 3/5/19.
//  Copyright © 2019 Truong Nguyen Nhut. All rights reserved.
//

import UIKit

public extension UIView {
    func embeded(inView superView: UIView, inset: UIEdgeInsets = UIEdgeInsets.zero) {
        NSLayoutConstraint.activate([topAnchor.constraint(equalTo: superView.topAnchor, constant: inset.top),
                                     leftAnchor.constraint(equalTo: superView.leftAnchor, constant: inset.left),
                                     rightAnchor.constraint(equalTo: superView.rightAnchor, constant: -inset.right),
                                     bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: -inset.bottom)])
    }
}
