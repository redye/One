//
//  Music.swift
//  One
//
//  Created by Hu on 16/9/6.
//  Copyright © 2016年 redye. All rights reserved.
//

import Foundation

struct Music: Decodable {
    var ID: String?
    var title: String?
    var cover: String?
    var platform: String?
    var musicID: String?
    var author: Author?
    
    init?(json: JSON) {
        self.ID = "id" <~~ json
        self.title = "title" <~~ json
        self.cover = "cover" <~~ json
        self.platform = "platform" <~~ json
        self.musicID = "music_id" <~~ json
        self.author = "author" <~~ json
    }
}