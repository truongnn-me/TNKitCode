//
//  SimplePage.swift
//  TNKitCode
//
//  Created by Truong Nguyen on 8/10/19.
//  Copyright © 2019 Truong Nguyen Nhut. All rights reserved.
//

import UIKit
import PureLayout

class SimplePage: UIViewController {
    var titleLabel: UILabel = {
        return UILabel(forAutoLayout: ())
    }()
    override func viewDidLoad() {
        view.backgroundColor = UIColor.random()
        //titleLabel.text = "Simple Page Demo"
        view.addSubview(titleLabel)
        titleLabel.autoCenterInSuperview()
    }
}
