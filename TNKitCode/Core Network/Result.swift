//
//  Result.swift
//  TNKitCode
//
//  Created by Truong Nguyen Nhut (Lazada Group) on 4/7/19.
//  Copyright © 2019 Truong Nguyen Nhut. All rights reserved.
//

import Foundation
public enum Result<Value, Error: Swift.Error> {
    case success(Value)
    case failed(Error)
}
