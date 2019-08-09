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
    let disposeBag = DisposeBag()
    
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    
    var viewModel: TabHeaderPageViewModel = {
        let viewModel = TabHeaderPageViewModel()
        return viewModel
    }()
    
    var indicatorView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .yellow
        return view
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), excludingEdge: .bottom)
        collectionView.autoMatch(.height, to: .height, of: view, withMultiplier: 0.95)
        collectionView.register(TabHeaderCell.self, forCellWithReuseIdentifier: "TabHeaderCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        
        view.addSubview(indicatorView)
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        indicatorView.autoPinEdge(toSuperviewEdge: .left, withInset: 0)
        indicatorView.autoPinEdge(.top, to: .bottom, of: collectionView, withOffset: 0)
        indicatorView.autoSetDimension(.width, toSize: 100)
        indicatorView.autoMatch(.height, to: .height, of: view, withMultiplier: 0.05)
        view.setBorder(color: .red, width: 1)
    }
    
}

extension TabHeaderPage: UICollectionViewDataSource {
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TabHeaderCell", for: indexPath)
        return cell
    }
    
}

extension TabHeaderPage: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

}
