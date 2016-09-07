//
//  SettingViewController.swift
//  One
//
//  Created by Hu on 16/9/7.
//  Copyright © 2016年 redye. All rights reserved.
//

import UIKit

class SettingViewController: BaseViewController {
    private var tableView: UITableView!
    private var imageView: UIImageView!
    private let kCell = "SettingCell"
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func setUI() {
        self.title = "设置"
        
        let button = UIButton(type: .System)
        button.frame = CGRect(x: 0, y: 20, width: 44, height: 44)
        button.setImage(UIImage(named: "icon_close"), forState: .Normal)
        button.setImage(UIImage(named: "icon_close"), forState: .Selected)
        button.addTarget(self, action: #selector(self.close), forControlEvents: .TouchUpInside)
        self.view.addSubview(button)
        
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: CGRectGetWidth(self.view.frame), height: 220 * kRatio))
        imageView.image = UIImage(named: "IMG_0021.JPG")
        imageView.clipsToBounds = true
        imageView.contentMode = .ScaleAspectFill
        
        tableView = UITableView(frame: CGRect(x: 0, y: -20, width: CGRectGetWidth(self.view.frame), height: CGRectGetHeight(self.view.frame) + 20), style: .Plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: kCell)
        tableView.tableHeaderView = imageView
        tableView.rowHeight = 50
        self.view.addSubview(tableView)
        
        self.view.bringSubviewToFront(button)
    }
}

extension SettingViewController {
    @objc private func close() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}

extension SettingViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(kCell, forIndexPath: indexPath)
        cell.accessoryType = .DisclosureIndicator
        cell.selectionStyle = .None
        cell.textLabel?.text = "其他设置"
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let otherSettingViewController = OtherSettingViewController()
        self.navigationController?.pushViewController(otherSettingViewController, animated: true)
    }
}
