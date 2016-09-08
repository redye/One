//
//  MusicViewController.swift
//  One
//
//  Created by Hu on 16/8/24.
//  Copyright © 2016年 redye. All rights reserved.
//

import UIKit

class MusicViewController: BaseViewController {
    
    private var tableView: UITableView!
    private let kCell = "MusicCell"
    private let titles = ["音乐故事", "歌词", "专辑介绍"]
    private var headerIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func setUI() {
        super.setUI()
        self.title = "音乐"
        
        let height = CGRectGetHeight(self.contentView.frame) - CGRectGetHeight((self.tabBarController?.tabBar.frame)!)
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: CGRectGetWidth(self.contentView.frame), height: height), style: .Grouped)
        tableView.separatorStyle = .None
        tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: kCell)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.sectionFooterHeight = 0.1
        tableView.sectionHeaderHeight = 60.0
        self.contentView.addSubview(tableView)
    }
}

extension MusicViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(kCell, forIndexPath: indexPath)
        return cell
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60.0
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let identifier = "MultiHeaderView"
            var headerView = tableView.dequeueReusableHeaderFooterViewWithIdentifier(identifier) as? MusicHeaderView
            if headerView == nil {
                headerView = MusicHeaderView(reuseIdentifier: identifier)
                headerView!.selections = ["故事", "词", "专辑"]
                headerView!.delegate = self
            }
            headerView!.setTitle(titles[headerIndex])
            return headerView
        } else {
            let identifier = "DefaultHeaderView"
            var headerView = tableView.dequeueReusableHeaderFooterViewWithIdentifier(identifier) as? MusicHeaderView
            if headerView == nil {
                headerView = MusicHeaderView(reuseIdentifier: identifier)
                headerView!.setTitle("评论列表")
            }
            return headerView
        }
    }
}

extension MusicViewController: MusicHeaderViewDelegate {
    func headerView(headerView: MusicHeaderView, selectedAtIndex index: Int) {
        self.headerIndex = index
        headerView.setTitle(titles[headerIndex])
    }
}
