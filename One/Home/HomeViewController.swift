//
//  HomeViewController.swift
//  One
//
//  Created by Hu on 16/8/24.
//  Copyright © 2016年 redye. All rights reserved.
//

import UIKit

let kHomeMargin: CGFloat = 10.0

class HomeViewController: BaseViewController {
    
    private var scrollView: UIScrollView = {
        let tmp = UIScrollView()
        tmp.layer.borderWidth = 3.0
        tmp.layer.borderColor = UIColor.colorWithHexString("#808080")?.CGColor
        tmp.layer.cornerRadius = 4.0
        tmp.pagingEnabled = true
        tmp.showsHorizontalScrollIndicator = false
        tmp.bounces = false
        return tmp
    }()
    
    private var leftArtView: ArtView!
    private var centerArtView: ArtView!
    private var rightArtView: ArtView!
    private var count: Int = 0
    private var currentIndex: Int = 0
    
    private var anas: Anas? {
        didSet {
            count = anas?.anas?.count ?? 0
            self.setDefaultData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.requestData(false)
    }
    
    override func setUI() {
        super.setUI()
        self.scrollView.delegate = self
        self.contentView.addSubview(self.scrollView)
        
        leftArtView = ArtView()
        self.scrollView.addSubview(leftArtView)
        
        centerArtView = ArtView()
        self.scrollView.addSubview(centerArtView)
        
        rightArtView = ArtView()
        self.scrollView.addSubview(rightArtView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let width = CGRectGetWidth(self.contentView.frame) - kHomeMargin * 2
        let height = CGRectGetHeight(self.contentView.frame) - CGRectGetHeight((self.tabBarController?.tabBar.frame)!) - kHomeMargin
        self.scrollView.frame = CGRectMake(kHomeMargin, kHomeMargin, width, height)
        self.scrollView.contentSize = CGSize(width: width * 3, height: height)
        self.scrollView.setContentOffset(CGPointMake(width, 0), animated: false)
        self.leftArtView.frame = CGRectMake(0, 0, width, height)
        self.centerArtView.frame = CGRectMake(width, 0, width, height)
        self.rightArtView.frame = CGRectMake(width * 2, 0, width, height)
    }
}

// MARK: - Request
extension HomeViewController {
    func requestData(animated: Bool) {
        let urlString = kBaseURL.stringByAppendingString(kApiHpMore)
        GET(urlString, parameters: nil) { [unowned self] json, error in
            guard let json = json else {
                printLog(error)
                return
            }
            self.anas = Anas(json: json)
        }
    }
}

// MARK: - Data
extension HomeViewController {
    func setDefaultData() {
        currentIndex = 0
        let leftIndex = (count - 1) % count
        let rightIndex = (currentIndex + 1) % count
        leftArtView.updateWith(model: anas?.anas?[leftIndex])
        centerArtView.updateWith(model: anas?.anas?[currentIndex])
        rightArtView.updateWith(model: anas?.anas?[rightIndex])
    }
    
    func reloadData() {
        let offset = scrollView.contentOffset
        if offset.x > CGRectGetWidth(scrollView.frame) {
            currentIndex = (currentIndex + 1) % count
        } else if offset.x < CGRectGetWidth(scrollView.frame) {
            currentIndex = (currentIndex + count - 1) % count
        }
        let leftIndex = (currentIndex + count - 1) % count
        let rightIndex = (currentIndex + 1) % count
        leftArtView.updateWith(model: anas?.anas?[leftIndex])
        centerArtView.updateWith(model: anas?.anas?[currentIndex])
        rightArtView.updateWith(model: anas?.anas?[rightIndex])
    }
}

// MARK: - Delegate
extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        self.reloadData()
        scrollView.setContentOffset(CGPointMake(CGRectGetWidth(scrollView.frame), 0), animated: false)
    }
}
