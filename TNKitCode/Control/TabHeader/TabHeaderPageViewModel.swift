//
//  TabHeaderPageViewModel.swift
//  TNKitCode
//
//  Created by Nguyen Nhut Truong on 8/8/19.
//  Copyright © 2019 Truong Nguyen Nhut. All rights reserved.
//

import Foundation

public class TabHeaderPageViewModel {
    var listItemTab: [DefaultItemModel] = []
    init() {
        listItemTab.append(contentsOf: Array(1...10).map { DefaultItemModel(title: "Title \($0)") })
    }
}
