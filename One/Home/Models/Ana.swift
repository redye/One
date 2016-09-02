//
//  AnaModel.swift
//  One
//
//  Created by Hu on 16/9/1.
//  Copyright © 2016年 redye. All rights reserved.
//

import Foundation

public struct Ana: Decodable {
    
    public let hpContentID: String?
    public let hpTitle: String?
    public let authorID: String?
    public let hpImgUrl: String?
    public let hpImgOriginalUrl: String?
    public let hpAuthor: String?
    public let ipadUrl: String?
    public let hpContent: String?
    public let hpMakettime: String?
    public let lastUpdateDate: String?
    public let webUrl: String?
    public let wbImgUrl: String?
    public let praisenum: Int?
    public let sharenum: Int?
    public let commentnum: Int?
    
    public init?(json: JSON) {
        self.hpContentID = "hpcontent_id" <~~ json
        self.hpTitle = "hp_title" <~~ json
        self.authorID = "author_id" <~~ json
        self.hpImgUrl = "hp_img_url" <~~ json
        self.hpImgOriginalUrl = "hp_img_original_url" <~~ json
        self.hpAuthor = "hp_author" <~~ json
        self.ipadUrl = "ipad_url" <~~ json
        self.hpContent = "hp_content" <~~ json
        self.hpMakettime = "hp_makettime" <~~ json
        self.lastUpdateDate = "last_update_date" <~~ json
        self.webUrl = "web_url" <~~ json
        self.wbImgUrl = "wb_img_url" <~~ json
        self.praisenum = "praisenum" <~~ json
        self.sharenum = "sharenum" <~~ json
        self.commentnum = "commentnum" <~~ json
    }
}