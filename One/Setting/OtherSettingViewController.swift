//
//  OtherSettingViewController.swift
//  One
//
//  Created by Hu on 16/9/7.
//  Copyright © 2016年 redye. All rights reserved.
//

import UIKit

class OtherSettingViewController: BaseViewController {
    
    private var tableView: UITableView!
    private let kCell = "OtherSettingCell"
    private var dataArray: [String]!

    override func setUI() {
        self.navigationController?.navigationBarHidden = false
        self.automaticallyAdjustsScrollViewInsets = false
        self.title = "其他设置"
        for view in (self.navigationController?.navigationBar.subviews)! {
            view.backgroundColor = UIColor.whiteColor()
        }
        
        tableView = UITableView(frame: CGRectMake(0, 64, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) - 64), style: .Plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: kCell)
        self.view.addSubview(tableView)
        
        dataArray = ["夜间模式", "流量播放提醒", "清除缓存", "去评分", "关注我们", "联系我们", "用户协议", "版本号"]
    }
}

extension OtherSettingViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(kCell, forIndexPath: indexPath)
        cell.selectionStyle = .None
        cell.accessoryType = .DisclosureIndicator
        cell.textLabel?.text = dataArray[indexPath.row]
        return cell
    }
}
