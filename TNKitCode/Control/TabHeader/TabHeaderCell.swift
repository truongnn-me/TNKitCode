//
//  TabHeaderCell.swift
//  TNKitCode
//
//  Created by Nguyen Nhut Truong on 8/8/19.
//  Copyright © 2019 Truong Nguyen Nhut. All rights reserved.
//

import UIKit
import PureLayout

class TabHeaderCell: UICollectionViewCell {
    
    var itemView: TabHeaderItemView = {
        let itemView = TabHeaderItemView()
        return itemView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        itemView.translatesAutoresizingMaskIntoConstraints = false
        setBorder(color: .blue, width: 2)        
        contentView.addSubview(itemView)
        itemView.autoPinEdgesToSuperviewEdges()
        itemView.setBorder(color: .yellow, width: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class TabHeaderItemView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

