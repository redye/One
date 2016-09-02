//
//  Kit.swift
//  One
//
//  Created by Hu on 16/9/1.
//  Copyright © 2016年 redye. All rights reserved.
//

import Foundation

public func printLog<T>(message: T,
                    file: String = #file,
                  method: String = #function,
                    line: Int = #line) {
    #if DEBUG
    print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
    #endif
}