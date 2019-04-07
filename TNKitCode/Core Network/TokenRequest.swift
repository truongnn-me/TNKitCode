//
//  TokenRequest.swift
//  TNKitCode
//
//  Created by Truong Nguyen Nhut (Lazada Group) on 4/7/19.
//  Copyright © 2019 Truong Nguyen Nhut. All rights reserved.
//

import Foundation

public protocol TokenRequest {
    func resume()
    func cancel()
    func suspend()
}
