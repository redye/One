//
//  BaseViewController.swift
//  One
//
//  Created by Hu on 16/8/23.
//  Copyright © 2016年 redye. All rights reserved.
//

import UIKit

public class BaseViewController: UIViewController {
    
    var contentView: UIView = {
        let tmp = UIView()
        tmp.backgroundColor = UIColor.whiteColor()
        return tmp
    }()

    override public func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
    }
    
    public func setUI() {
        self.view.addSubview(self.contentView)
        self.contentView.frame = CGRectMake(0, 64, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) - 64)
        self.automaticallyAdjustsScrollViewInsets = false
        
        self.navigationItem.title = "One"
        let leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Search, target: self, action: #selector(self.search))
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
        
        let rightButton = UIButton(type: .Custom)
        rightButton.setImage(UIImage(named: "right_bar_button"), forState: .Normal)
        rightButton.setImage(UIImage(named: "right_bar_button"), forState: .Highlighted)
        rightButton.bounds = CGRectMake(0, 0, 44, 44)
        rightButton.center = CGPoint(x: self.view.bounds.size.width - 22, y: 22)
        rightButton.addTarget(self, action: #selector(self.rightButtonClick), forControlEvents: .TouchUpInside)
        self.navigationController?.navigationBar.addSubview(rightButton)
    }
    
    public func rightButtonClick() {
        print("设置")
    }
    
    public func search() {
       print("搜索")
    }

}
