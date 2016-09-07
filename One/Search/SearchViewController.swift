//
//  SearchViewController.swift
//  One
//
//  Created by Hu on 16/9/2.
//  Copyright © 2016年 redye. All rights reserved.
//

import UIKit


let kSearchViewControllerCell = "SearchViewControllerCell"

enum SearchType: Int {
    case Ana = 0
    case Reading
    case Music
    case Movie
    case Author
}

class SearchViewController: BaseViewController {
    
    private var placeholeView: PlaceholderView!
    private var searchView: SearchView!
    private var tableView: UITableView!
    private var type: SearchType = .Ana
    private var key: String = ""
    private var tableHeaderView: YHSelectionView = {
        let selections = ["插画", "阅读", "音乐", "电影", "音乐人"]
        let tableHeaderView = YHSelectionView(frame: CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.size.width, height: 40),
                                              selections: selections)
        tableHeaderView.itemWidth = CGRectGetWidth(UIScreen.mainScreen().bounds) / CGFloat(selections.count)
        tableHeaderView.backgroundColor = UIColor.whiteColor()
        return tableHeaderView
    }()
    private var anas: Anas?
    private var musics: Musics?
    private var authors: Authors?

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
        
        searchView = SearchView(frame: CGRect(x: 0, y: 20, width: CGRectGetWidth(self.view.frame), height: 44)) { [weak self] in
            if let strongSelf = self {
                strongSelf.dismissViewControllerAnimated(true, completion: nil)
            }
        }
        searchView.setSearchHandler() { [weak self] key in
            if let strongSelf = self {
                strongSelf.key = key
                strongSelf.requestData(key, type: .Ana, animated: true)
            }
        }
        self.view.addSubview(searchView)
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: CGRectGetWidth(self.contentView.frame), height: CGRectGetHeight(self.contentView.frame)), style: .Plain)
        tableView.registerClass(SearchCell.self, forCellReuseIdentifier: kSearchViewControllerCell)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 65.0 * kRatio
        tableView.sectionHeaderHeight = 40.0
    }
}

extension SearchViewController {
    func requestData(key: String, type: SearchType, animated: Bool) {
        
        let searchKey = key.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        let urlString = kBaseURL.stringByAppendingFormat("%@%@%@", kApiSearch, self.infix(type), searchKey!)
        GET(urlString, parameters: nil) { [weak self] json, request, error in
            if let strongSelf = self {
                strongSelf.handlerResponse(json, request: request, error: error)
            }
        }
    }
    
    private func handlerResponse(json: [String: AnyObject]?, request: NSURLRequest?, error: NSError?) {
        guard let json = json else {
            return
        }
        if !tableView.isDescendantOfView(self.contentView) {
            self.contentView.addSubview(tableView)
            placeholeView.removeFromSuperview()
            placeholeView = nil
        }
        let string = request?.URL?.absoluteString
        if string!.containsString("hp") { // 解析成插画短句类型
            self.anas = Anas(json: json)
        } else if string!.containsString("music") { // 解析成音乐类型
            self.musics = Musics(json: json)
        } else if string!.containsString("author") { // 解析成音乐人类型
            self.authors = Authors(json: json)
        }
        self.tableView.reloadData()
    }
    
    private func infix(type: SearchType) -> String {
        switch type {
        case .Ana:
            return "hp/"
        case .Reading:
            return "hp/"
        case .Music:
            return "music/"
        case .Movie:
            return "music/"
        case .Author:
            return "author/"
        }
    }
}

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.type.rawValue < 2 {
            return self.anas?.anas?.count ?? 0
        } else if self.type.rawValue < 4 {
            return self.musics?.musics?.count ?? 0
        } else {
            return self.authors?.authors?.count ?? 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: SearchCell = tableView.dequeueReusableCellWithIdentifier(kSearchViewControllerCell, forIndexPath: indexPath) as! SearchCell
        if self.type.rawValue < 2 {
            cell.updateWithAna(ana: self.anas?.anas?[indexPath.row])
        } else if self.type.rawValue < 4 {
            cell.updateWithMusic(music: self.musics?.musics?[indexPath.row])
        } else {
            cell.updateWithAuthor(author: self.authors?.authors?[indexPath.row])
        }
        return cell
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        self.tableHeaderView.delegate = self
        return self.tableHeaderView
    }
}

extension SearchViewController: YHSelectionViewDelegate {
    func seletionView(seletionView: YHSelectionView, didSelectedAtIndex index: Int) {
        printLog("index: \(index)")
        self.type = SearchType(rawValue: index)!
        self.requestData(self.key, type: self.type, animated: false)
    }
}
