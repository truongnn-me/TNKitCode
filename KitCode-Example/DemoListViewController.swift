//
//  DemoListViewController.swift
//  KitCode-Example
//
//  Created by Nguyen Nhut Truong on 8/8/19.
//  Copyright © 2019 Truong Nguyen Nhut. All rights reserved.
//

import UIKit

class DemoListViewController: UIViewController {
    
    lazy var listDemoItem: [DemoItemModel] = {
        let demoItemModel1 = DemoItemModel(title: "Tab Header", nextScreen: "TabHeaderPage")
        return [demoItemModel1]
    }()
    
    lazy var tableView: UITableView = {
        return UITableView(frame: .zero)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(DemoItemCell.self, forCellReuseIdentifier: "DemoItemCell")
        view.addSubview(tableView)
        tableView.embededInSupperView()
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension DemoListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listDemoItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DemoItemCell", for: indexPath)
        let data = listDemoItem[indexPath.row]
        cell.textLabel?.text = data.title
        return cell
    }
}

extension DemoListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = TabHeaderPageDemo()
        navigationController?.pushViewController(viewController, animated: true)
        //present(viewController, animated: true, completion: nil)
    }
}

class DemoItemCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

struct DemoItemModel {
    let title: String
    let nextScreen: String
}


