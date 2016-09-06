//
//  SearchView.swift
//  One
//
//  Created by Hu on 16/9/2.
//  Copyright © 2016年 redye. All rights reserved.
//

import UIKit

typealias CancelClosure = () -> Void
typealias SearchHandler = (key: String) -> ()

class SearchView: UIView {
    
    private var searchBar: UISearchBar!
    private var cancelButton: UIButton!
    private var cancelClosure: CancelClosure?
    private var searchHandler: SearchHandler?
    
    required init(frame: CGRect, cancelClosure: CancelClosure) {
        super.init(frame: frame)
        self.setUI()
        self.cancelClosure = cancelClosure 
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        self.backgroundColor = UIColor.colorWithHexString("#f9f9f9")
        
        searchBar = UISearchBar()
        searchBar.delegate = self
        searchBar.placeholder = "输入搜索内容"
        searchBar.barTintColor = UIColor.colorWithHexString("#f9f9f9")
        searchBar.backgroundImage = UIImage()
        searchBar.inputAccessoryView = inputAccessoryView()
        self.addSubview(searchBar)
        
        cancelButton = UIButton(type: .Custom)
        cancelButton.setTitle("取消", forState: .Normal)
        cancelButton.setTitleColor(UIColor.colorWithHexString("#007aff"), forState: .Normal)
        cancelButton.addTarget(self, action: #selector(self.buttonClick), forControlEvents: .TouchUpInside)
        cancelButton.titleLabel?.font = UIFont.systemFontOfScaleSize(size: 16.0)
        cancelButton.contentHorizontalAlignment = .Left
        self.addSubview(cancelButton)
    }
    
    private func inputAccessoryView() -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 30))
        view.backgroundColor = UIColor.whiteColor()
        let button = UIButton(type: .System)
        button.setTitle("完成", forState: .Normal)
        button.frame = CGRect(x: CGRectGetWidth(UIScreen.mainScreen().bounds) - 50, y: 0, width: 50, height: 30)
        button.addTarget(self, action: #selector(self.keyboardDown), forControlEvents: .TouchUpInside)
        view.addSubview(button)
        return view
    }
    
    @objc private func keyboardDown() {
        searchBar.resignFirstResponder()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layoutUI()
    }
    
    private func layoutUI() {
        var width = CGRectGetWidth(self.frame) - 40
        let height:CGFloat = 28.0
        searchBar.frame = CGRect(x: 0, y: 0, width: width, height: height)
        searchBar.center.y = CGRectGetHeight(self.frame) / 2.0
        
        let x = CGRectGetMaxX(searchBar.frame)
        width = CGRectGetWidth(self.frame) - x
        cancelButton.frame = CGRect(x: x, y: 0, width: 40, height: height)
        cancelButton.center.y = CGRectGetHeight(self.frame) / 2.0
    }
}

extension SearchView {
    @objc private func buttonClick() {
        if let closure = self.cancelClosure {
            closure()
        }
    }
}


extension SearchView: UISearchBarDelegate {
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        let key = searchBar.text?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        guard let searchKey = key else { return }
        if let searchHandler = self.searchHandler {
            searchHandler(key: searchKey)
        }
    }
}

extension SearchView {
    func setSearchHandler(searchHandler: SearchHandler) {
        self.searchHandler = searchHandler
    }
}