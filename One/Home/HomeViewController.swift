//
//  HomeViewController.swift
//  One
//
//  Created by Hu on 16/8/24.
//  Copyright © 2016年 redye. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func setUI() {
        super.setUI()
        self.navigationItem.title = "One"
        let leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Search, target: self, action: #selector(self.search))
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    
    func search() {
        
    }
}
