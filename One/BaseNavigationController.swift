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

        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.grayColor()]
    }

}
