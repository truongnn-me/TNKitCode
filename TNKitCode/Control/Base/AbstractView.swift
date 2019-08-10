//
//  AbstractView.swift
//  TNKitCode
//
//  Created by Nguyen Nhut Truong on 8/9/19.
//  Copyright © 2019 Truong Nguyen Nhut. All rights reserved.
//

import UIKit

class AbstractView: UIView {
    
    public init() {
        super.init(frame: .zero)
        setupView()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    open func setupView() {}
    
}
