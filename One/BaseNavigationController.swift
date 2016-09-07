//
//  BaseNavigationController.swift
//  One
//
//  Created by Hu on 16/8/24.
//  Copyright © 2016年 redye. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let foregroundColor = UIColor.colorWithHexString("#4f5c6b") {
            self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: foregroundColor]
        }
        
        self.navigationBar.barTintColor = UIColor.whiteColor()
    }
}
