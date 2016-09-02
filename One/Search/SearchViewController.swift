//
//  SearchViewController.swift
//  One
//
//  Created by Hu on 16/9/2.
//  Copyright © 2016年 redye. All rights reserved.
//

import UIKit

class SearchViewController: BaseViewController {
    
    private var placeholeView: PlaceholderView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func setUI() {
        super.setUI()
        
        let navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: CGRectGetWidth(self.view.frame), height: 64))
        self.view.addSubview(navigationBar)
        
        placeholeView = PlaceholderView()
        placeholeView.frame = CGRect(x: 0, y: 90 * kRatio, width: CGRectGetWidth(self.view.frame), height: 0)
        placeholeView.updateWithImage(UIImage(named: "AppIcon"), label: ["图片", "文章", "音乐", "电影", "作者"])
        self.contentView.addSubview(placeholeView)
    }
}
