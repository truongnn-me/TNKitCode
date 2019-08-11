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
    
    let viewControllers: [UIViewController] = {
        return Array(1...10).map({ (index) -> UIViewController in
            let page = SimplePage()
            page.titleLabel.text = "Simple Demo \(index)"
            return page
        })
    }()
    
    let pageViewController: UIPageViewController = {
        let page = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        return page
    }()
    
    let contentSwipeView: UIView = {
        let contentView = UIView(forAutoLayout: ())
        return contentView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Tab Header View Demo"
        view.backgroundColor = .white
        addChild(tabHeadePage)
        view.addSubview(tabHeadePage.view)
        tabHeadePage.view.translatesAutoresizingMaskIntoConstraints = false
        tabHeadePage.view.autoPinEdgesToSuperviewSafeArea(with: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), excludingEdge: .bottom)
        tabHeadePage.view.autoSetDimension(.height, toSize: 50)
        tabHeadePage.didMove(toParent: self)
        tabHeadePage.delegate = self
        
        view.addSubview(contentSwipeView)
        contentSwipeView.autoPinEdge(.top, to: .bottom, of: tabHeadePage.view)
        contentSwipeView.autoPinEdge(toSuperviewEdge: .left)
        contentSwipeView.autoPinEdge(toSuperviewEdge: .right)
        contentSwipeView.autoPinEdge(toSuperviewSafeArea: .bottom)
        contentSwipeView.setBorder()
        
        addChild(pageViewController)
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        contentSwipeView.addSubview(pageViewController.view)
        pageViewController.dataSource = self
        pageViewController.view.setBorder(color: .red, width: 3)
        pageViewController.view.autoPinEdgesToSuperviewEdges()
        pageViewController.didMove(toParent: self)
        pageViewController.setViewControllers([viewControllers[0]], direction: .forward, animated: true, completion: nil)
    }
    
}

extension TabHeaderPageDemo: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        if let viewControllerIndex = self.viewControllers.firstIndex(of: viewController) {
            if viewControllerIndex == 0 {
                // wrap to last page in array
                return self.viewControllers.last
            } else {
                // go to previous page in array
                return self.viewControllers[viewControllerIndex - 1]
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        if let viewControllerIndex = self.viewControllers.firstIndex(of: viewController) {
            if viewControllerIndex < self.viewControllers.count - 1 {
                // go to next page in array
                return self.viewControllers[viewControllerIndex + 1]
            } else {
                // wrap to first page in array                
                return self.viewControllers.first
            }
        }
        return nil
    }
}

extension TabHeaderPageDemo: TabHeaderPageProtocol {
    func didSelect(index: Int) {
        pageViewController.setViewControllers([viewControllers[index]], direction: .forward, animated: false, completion: nil)
    }
}
