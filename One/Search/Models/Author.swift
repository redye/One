//
//  Author.swift
//  One
//
//  Created by Hu on 16/9/6.
//  Copyright © 2016年 redye. All rights reserved.
//

import Foundation

struct Author: Decodable {
    
    var userID: String?
    var userName: String?
    var webURL: String?
    var desc: String?
    
    init?(json: JSON) {
        self.userID = "user_id" <~~ json
        self.userName = "user_name" <~~ json
        self.webURL = "web_url" <~~ json
        self.desc = "desc" <~~ json
    }
}