//
//  Dependencyfactory.swift
//  TNKitCode
//
//  Created by Truong Nguyen Nhut (Lazada Group) on 4/7/19.
//  Copyright © 2019 Truong Nguyen Nhut. All rights reserved.
//

import Foundation

public class Dependencyfactory: DependencyContainer {
    public init() {
        
    }
    public func makeDataProvider() -> DataProvider {
        return URLSession.shared
    }
}
