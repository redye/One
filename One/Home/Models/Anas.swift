//
//  Anas.swift
//  One
//
//  Created by Hu on 16/9/1.
//  Copyright © 2016年 redye. All rights reserved.
//

import Foundation

public struct Anas: Decodable {
    public let anas: [Ana]?
    public let res: Int?
    
    public init?(json: JSON) {
        self.anas = "data" <~~ json
        self.res = "res" <~~ json
    }
}