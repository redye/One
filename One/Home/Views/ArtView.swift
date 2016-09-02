//
//  ArtView.swift
//  One
//
//  Created by Hu on 16/8/29.
//  Copyright © 2016年 redye. All rights reserved.
//

import UIKit

let ArtViewMargin: CGFloat = 8.0

// MARK: - Properties
class ArtView: UIView {
    private lazy var contentView: UIView = {
        let tmp = UIView()
        return tmp
    }()
    
    private lazy var imageView: UIImageView = {
        let tmp = UIImageView()
        tmp.contentMode = .ScaleAspectFill
        tmp.clipsToBounds = true
        return tmp
    }()
    
    private lazy var titleView: TitleView = {
        let tmp = TitleView()
        return tmp
    }()
    
    private lazy var detailLabel: UILabel = {
        let tmp = UILabel()
        tmp.numberOfLines = 0
        tmp.font = UIFont.systemFontOfSize(14.0)
        return tmp
    }()
    
    private lazy var dateLabel: UILabel = {
        let tmp = UILabel()
        tmp.textAlignment = .Right
        tmp.font = UIFont.systemFontOfSize(12.0)
        return tmp
    }()
}

// MARK: - UI
extension ArtView {
    override func layoutSubviews() {
        super.layoutSubviews()
        if !self.contentView.isDescendantOfView(self) {
            self.addSubview(self.contentView)
            self.contentView.addSubview(self.imageView)
            self.contentView.addSubview(self.titleView)
            self.contentView.addSubview(self.detailLabel)
            self.contentView.addSubview(self.dateLabel)
        }
        self.layoutUI()
    }
    
    private func layoutUI() {
        var width = CGRectGetWidth(self.frame) - ArtViewMargin * 2
        var height = CGRectGetHeight(self.frame) - ArtViewMargin * 2
        self.contentView.frame = CGRect(x: ArtViewMargin, y: ArtViewMargin, width: width, height: height)
        
        width = CGRectGetWidth(self.contentView.frame)
        height = width / HomeWidthHeightRatio
        self.imageView.frame = CGRect(x: 0, y: 0, width: width, height: height)
        
        var y = CGRectGetMaxY(self.imageView.frame) + 11.0
        height = 13.0
        self.titleView.frame = CGRectMake(0, y, width, height)
        
        self.detailLabel.sizeToFit()
        y = CGRectGetMaxY(self.titleView.frame) + 23
        self.detailLabel.frame = CGRectMake(0, y, width, CGRectGetHeight(self.detailLabel.bounds))
        
        y = CGRectGetMaxY(self.detailLabel.frame) + 26
        height = 11.0
        self.dateLabel.frame = CGRectMake(0, y, width, height)
    }
}

// MARK: - Public
extension ArtView {
    func updateWith(model model: Ana?) {
        guard let model = model else { return }
        let ana = model
        self.titleView.updateWith(title: ana.hpTitle, author: ana.hpAuthor)
        self.dateLabel.text = ana.lastUpdateDate
        self.imageView.kf_setImageWithURL(NSURL(string: ana.hpImgUrl!)!)
        if let detailString = ana.hpContent {
            let mutableAttributedString = NSMutableAttributedString(string: detailString)
            let paragrapStyle = NSMutableParagraphStyle()
            paragrapStyle.lineSpacing = 18.0
            mutableAttributedString.addAttribute(NSParagraphStyleAttributeName, value: paragrapStyle, range: NSMakeRange(0, (detailString as NSString).length))
            self.detailLabel.attributedText = mutableAttributedString
        }
        self.setNeedsLayout()
    }
}