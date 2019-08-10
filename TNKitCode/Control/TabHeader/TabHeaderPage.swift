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
    
    let disposeBag = DisposeBag()
    
    var stackLayout: UIStackView = {
        let stackView = UIStackView(forAutoLayout: ())
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing // .FillEqually .FillProportionally .EqualSpacing .EqualCentering
        stackView.alignment = .fill // .Leading .FirstBaseline .Center .Trailing .LastBaseline
        stackView.spacing = 10
        return stackView
    }()
    
    var tabBarHeaderView: UIScrollView = {
        let scrollView = UIScrollView(forAutoLayout: ())
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
        tabBarHeaderView.translatesAutoresizingMaskIntoConstraints = false
        tabBarHeaderView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets(top: 0, left: 0, bottom: 0, right:0), excludingEdge: .bottom)
        tabBarHeaderView.autoMatch(.height, to: .height, of: view, withMultiplier: 0.95)
        
        tabBarHeaderView.addSubview(stackLayout)
        stackLayout.autoPinEdgesToSuperviewEdges()
        stackLayout.translatesAutoresizingMaskIntoConstraints = false
        for index in 0...10 {
            let childView = DefaultTabHeaderItemView(forAutoLayout: ())
            childView.tag = index
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(clickAction))
            childView.addGestureRecognizer(tapGesture)
            stackLayout.addArrangedSubview(childView)
        }
        
        for childView in stackLayout.arrangedSubviews {
            childView.autoMatch(.height, to: .height, of: tabBarHeaderView)
        }
        view.addSubview(indicatorView)
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        tabIndicatorLeadingConstraint = indicatorView.autoPinEdge(toSuperviewEdge: .left, withInset: 0)
        indicatorView.autoPinEdge(.top, to: .bottom, of: tabBarHeaderView, withOffset: 0)
        indicatorView.autoSetDimension(.width, toSize: 29)
        indicatorView.autoMatch(.height, to: .height, of: view, withMultiplier: 0.05)
    }
    
    @objc func clickAction() {
        print("####Call me")
        let view = stackLayout.arrangedSubviews[5]
        self.tabIndicatorLeadingConstraint?.isActive = false
        tabIndicatorLeadingConstraint = indicatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        UIView.animate(withDuration: 0.5) {
            self.tabIndicatorLeadingConstraint?.isActive = true
        }
    }
    
}


extension TabHeaderPage: UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Call me")
        let cell = collectionView.cellForItem(at: indexPath)
        self.tabIndicatorLeadingConstraint?.isActive = false
        tabIndicatorLeadingConstraint = indicatorView.leadingAnchor.constraint(equalTo: cell!.leadingAnchor)
        UIView.animate(withDuration: 0.5) {
            self.tabIndicatorLeadingConstraint?.isActive = true
        }
        
    }
}
