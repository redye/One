
//
//  PlaceholderView.swift
//  One
//
//  Created by Hu on 16/9/2.
//  Copyright © 2016年 redye. All rights reserved.
//

import UIKit

let kPlaceholderViewImageWidth: CGFloat = 121

class PlaceholderView: UIView {
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: kPlaceholderViewImageWidth, height: kPlaceholderViewImageWidth))
        imageView.contentMode = .ScaleAspectFill
        imageView.layer.cornerRadius = kPlaceholderViewImageWidth / 2.0
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var tipLabel: UILabel = {
        let tipLabel = UILabel()
        tipLabel.textAlignment = .Center
        tipLabel.font = UIFont.systemFontOfSize(15.0)
        return tipLabel
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if !self.imageView.isDescendantOfView(self) {
            self.addSubview(self.imageView)
            self.addSubview(self.tipLabel)
        }
        self.layoutUI()
    }
    
    private func layoutUI() {
        imageView.center = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetHeight(imageView.frame) / 2.0)
        let y = CGRectGetMaxY(imageView.frame) + 48.0
        tipLabel.frame = CGRect(x: 0, y: y, width: CGRectGetWidth(self.frame), height: 15)
        
        self.frame.size.height = CGRectGetMaxY(tipLabel.frame)
    }
}

extension PlaceholderView {
    func updateWithImage(image: UIImage?, label: [String]) {
        if let image = image {
            self.imageView.image = image
        }
        let string = (label as NSArray).componentsJoinedByString("  ")
        self.tipLabel.text = string
    }
}
