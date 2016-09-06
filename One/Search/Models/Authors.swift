//
//  Authors.swift
//  One
//
//  Created by Hu on 16/9/6.
//  Copyright © 2016年 redye. All rights reserved.
//

import Foundation

struct Authors: Decodable {
    var res: Int?
    var authors: [Author]?
    
    init?(json: JSON) {
        self.res = "res" <~~ json
        self.authors = "data" <~~ json
    }
}