//
//  TitleView.swift
//  One
//
//  Created by Hu on 16/8/29.
//  Copyright © 2016年 redye. All rights reserved.
//

import UIKit

class TitleView: UIView {
    private lazy var titleLable: UILabel = {
        let tmp = UILabel()
        tmp.font = UIFont.systemFontOfSize(14.0)
        return tmp
    }()
    
    private lazy var authorLabel: UILabel = {
        let tmp = UILabel()
        tmp.font = UIFont.systemFontOfSize(10.0)
        tmp.textColor = UIColor.colorWithHexString("#0c0c0c")
        tmp.textAlignment = .Right
        return tmp
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if !self.titleLable.isDescendantOfView(self) {
            self.addSubview(self.titleLable)
            self.addSubview(self.authorLabel)
        }
        
        self.layoutUI()
    }
}


extension TitleView {
    
    private func layoutUI() {
        self.titleLable.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        self.titleLable.sizeToFit()
        
        self.authorLabel.sizeToFit()
        let centerX = CGRectGetWidth(self.frame) - CGRectGetWidth(self.authorLabel.bounds) / 2.0
        self.authorLabel.center = CGPoint(x: centerX, y: CGRectGetHeight(self.frame) / 2.0)
    }
}

extension TitleView {
    func  updateWith(title title: String?, author: String?) {
        if let title = title {
            self.titleLable.text = title
        }
        if let author = author {
            self.authorLabel.text = author
        }
        self.setNeedsLayout()
    }
}