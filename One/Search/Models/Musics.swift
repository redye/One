//
//  Musics.swift
//  One
//
//  Created by Hu on 16/9/6.
//  Copyright © 2016年 redye. All rights reserved.
//

import Foundation

struct Musics: Decodable {
    
    var res: Int?
    var musics: [Music]?
    
    init?(json: JSON) {
        self.res = "res" <~~ json
        self.musics = "data" <~~ json
    }
}