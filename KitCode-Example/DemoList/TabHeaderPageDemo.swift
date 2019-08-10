//
//  TabHeaderPageDemo.swift
//  KitCode-Example
//
//  Created by Nguyen Nhut Truong on 8/9/19.
//  Copyright © 2019 Truong Nguyen Nhut. All rights reserved.
//

import UIKit

class TabHeaderPageDemo: UIViewController {
    let tabHeadePage: TabHeaderPage = {
        let viewModel = TabHeaderPageViewModel()
        let page = TabHeaderPage(viewModel: viewModel)
        return page
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addChild(tabHeadePage)
        view.addSubview(tabHeadePage.view)
        tabHeadePage.view.translatesAutoresizingMaskIntoConstraints = false
        tabHeadePage.view.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets(top: 100, left: 0, bottom: 0, right: 0), excludingEdge: .bottom)
        tabHeadePage.view.autoSetDimension(.height, toSize: 50)
        tabHeadePage.didMove(toParent: self)
    }
    
}
