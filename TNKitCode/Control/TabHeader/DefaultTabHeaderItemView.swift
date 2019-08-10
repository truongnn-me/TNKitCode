//
//  TabHeaderView..swift
//  TNKitCode
//
//  Created by Nguyen Nhut Truong on 8/8/19.
//  Copyright © 2019 Truong Nguyen Nhut. All rights reserved.
//

import UIKit
import PureLayout

class DefaultTabHeaderItemView: AbstractView {
    
    var label: UILabel = {
        let v = UILabel(forAutoLayout: ())
        return v
    }()
    
    override func setupView() {
        addSubview(label)
        label.autoAlignAxis(toSuperviewAxis: .horizontal)
        label.autoPinEdge(toSuperviewEdge: .left)
        label.autoPinEdge(toSuperviewEdge: .right)
        label.text = "Truong"
        setBorder(color: .blue, width: 1)
    }
    
}

