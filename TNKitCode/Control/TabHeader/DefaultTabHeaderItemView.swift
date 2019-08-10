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
        let label = UILabel(forAutoLayout: ())
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    override func setupView() {
        addSubview(label)
        label.autoAlignAxis(toSuperviewAxis: .horizontal)
        label.autoPinEdge(toSuperviewEdge: .left)
        label.autoPinEdge(toSuperviewEdge: .right)
        let randomLength = Int.random(in: 10...30)
        label.text = String.randomString(inLength: randomLength)
        setBorder(color: .blue, width: 1)
    }
    
}

