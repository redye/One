//
//  BaseViewController.swift
//  One
//
//  Created by Hu on 16/8/23.
//  Copyright © 2016年 redye. All rights reserved.
//

import UIKit

public class BaseViewController: UIViewController {

    override public func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
    }
    
    public func setUI() {
        self.view.backgroundColor = UIColor.whiteColor()
    }
}
