//
//  NetworkToken.swift
//  TNKitCode
//
//  Created by Truong Nguyen Nhut (Lazada Group) on 4/7/19.
//  Copyright © 2019 Truong Nguyen Nhut. All rights reserved.
//

import Foundation

public class NetworkToken: TokenRequest {
    let task: URLSessionTask
    init(task: URLSessionTask) {
        self.task = task
    }
    
    public func resume() {
        task.resume()
    }
    
    public func cancel() {
        task.cancel()
    }
    
    public func suspend() {
        task.suspend()
    }
}

