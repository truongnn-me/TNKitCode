//
//  TabHeaderPage.swift
//  TNKitCode
//
//  Created by Nguyen Nhut Truong on 8/8/19.
//  Copyright © 2019 Truong Nguyen Nhut. All rights reserved.
//

import UIKit
import PureLayout
import RxSwift
import RxCocoa

public class TabHeaderPage: UIViewController {
    
    fileprivate var tabIndicatorLeadingConstraint: NSLayoutConstraint?
    fileprivate var tabIndicatorWidthConstraint: NSLayoutConstraint?
    
    var stackLayout: UIStackView = {
        let stackView = UIStackView(forAutoLayout: ())
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 5
        return stackView
    }()
    
    var tabBarHeaderView: UIScrollView = {
        let scrollView = UIScrollView(forAutoLayout: ())
        scrollView.backgroundColor = .black
        return scrollView
    }()
    
    
    var viewModel: TabHeaderPageViewModel = {
        let viewModel = TabHeaderPageViewModel()
        return viewModel
    }()
    
    var indicatorView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .red
        return view
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tabBarHeaderView)
        tabBarHeaderView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets(top: 0, left: 0, bottom: 0, right:0), excludingEdge: .bottom)
        tabBarHeaderView.autoMatch(.height, to: .height, of: view, withMultiplier: 0.95)
        tabBarHeaderView.addSubview(stackLayout)
        stackLayout.autoPinEdgesToSuperviewEdges()
        _ = viewModel.listItemTab.map { (model) -> DefaultTabHeaderItemView in
            let tabItemView = DefaultTabHeaderItemView(forAutoLayout: ())
            tabItemView.label.text = model.title
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(TabHeaderPage.clickAction))
            tabItemView.addGestureRecognizer(tapGesture)
            stackLayout.addArrangedSubview(tabItemView)
            return tabItemView
        }
        for childView in stackLayout.arrangedSubviews {
            childView.autoMatch(.height, to: .height, of: tabBarHeaderView)
        }
        view.addSubview(indicatorView)
        indicatorView.autoPinEdge(.top, to: .bottom, of: tabBarHeaderView, withOffset: 0)
        indicatorView.autoMatch(.height, to: .height, of: view, withMultiplier: 0.05)
        tabIndicatorLeadingConstraint = indicatorView.autoPinEdge(toSuperviewEdge: .left, withInset: 0)
        tabIndicatorWidthConstraint = indicatorView.autoSetDimension(.width, toSize: 29)
    }
    
    @objc func clickAction(_ sender: AnyObject) {
        guard
            let tap = sender as? UITapGestureRecognizer,
            let view = tap.view else { return }
        tabIndicatorLeadingConstraint?.isActive = false
        tabIndicatorWidthConstraint?.isActive = false
        tabIndicatorLeadingConstraint = indicatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        tabIndicatorWidthConstraint = indicatorView.widthAnchor.constraint(equalTo: view.widthAnchor)
        UIView.animate(withDuration: 0.5) {
            self.tabIndicatorLeadingConstraint?.isActive = true
            self.tabIndicatorWidthConstraint?.isActive = true
        }
    }

}
