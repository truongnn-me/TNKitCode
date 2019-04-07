//
//  URLSessionExtension.swift
//  TNKitCode
//
//  Created by Truong Nguyen Nhut (Lazada Group) on 4/7/19.
//  Copyright © 2019 Truong Nguyen Nhut. All rights reserved.
//

import Foundation

extension URLSession: DataProvider {
    public func load(url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> TokenRequest {
        let task = dataTask(with: url, completionHandler: completionHandler)
        task.resume()
        return NetworkToken(task: task)
    }
}
