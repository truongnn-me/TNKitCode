//
//  ViewExtensions.swift
//  TNKitCode
//
//  Created by Truong Nguyen Nhut (Lazada Group) on 3/5/19.
//  Copyright © 2019 Truong Nguyen Nhut. All rights reserved.
//

import UIKit

public extension UIView {
    
    func embededInSupperView() {
        translatesAutoresizingMaskIntoConstraints = false
        if let superView = superview {
            NSLayoutConstraint.activate([topAnchor.constraint(equalTo: superView.topAnchor, constant: 0),
                                         leftAnchor.constraint(equalTo: superView.leftAnchor, constant: 0),
                                         rightAnchor.constraint(equalTo: superView.rightAnchor, constant: 0),
                                         bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: 0)])
        }
    }
    
    func setAutoDimension(toSize size: CGSize) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([widthAnchor.constraint(equalToConstant: size.width),
                                     heightAnchor.constraint(equalToConstant: size.height)])
        
    }
    
    
    func setBorder(color: UIColor = .red, width: CGFloat = 1) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
}
