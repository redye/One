//
//  MusicHeaderView.swift
//  One
//
//  Created by Hu on 16/9/8.
//  Copyright © 2016年 redye. All rights reserved.
//

import UIKit

@objc protocol MusicHeaderViewDelegate {
    optional func headerView(headerView: MusicHeaderView, selectedAtIndex index: Int)
}

class MusicHeaderView: UITableViewHeaderFooterView {

    private var titleLabel: UILabel!
    private let buttonWidth: CGFloat = 45.0
    private let buttonHeight: CGFloat = 18.0
    private var lastSelectionButton: UIButton?
    private let baseTag = 10000
    weak var delegate: MusicHeaderViewDelegate?
    
    var selections: [String]? {
        didSet {
            self.setOtherUI()
        }
    }
    
    private var buttons: [UIButton]?
    
    override init(reuseIdentifier: String?) {
        
        super.init(reuseIdentifier: reuseIdentifier)
        self.setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        self.contentView.backgroundColor = UIColor.colorWithHexString("#ececec")
        
        titleLabel = UILabel()
        titleLabel.font = UIFont.systemFontOfScaleSize(size: 14.0)
        titleLabel.textColor = UIColor.colorWithHexString("#979797")
        titleLabel.sizeToFit()
        self.contentView.addSubview(titleLabel)
    }
    
    private func setOtherUI() {
        buttons = [UIButton]()
        for i in 0 ..< (selections?.count)! {
            let button = UIButton(type: .Custom)
            button.setTitle(selections![i], forState: .Normal)
            button.setTitleColor(UIColor.colorWithHexString("#cbcbcb"), forState: .Normal)
            button.setTitleColor(UIColor.colorWithHexString("#ffd04f"), forState: .Selected)
            button.titleLabel?.font = UIFont.systemFontOfScaleSize(size: 14.0)
            button.addTarget(self, action: #selector(self.buttonClick(_:)), forControlEvents: .TouchUpInside)
            button.tag = baseTag + i
            buttons?.append(button)
            self.contentView.addSubview(button)
            if (i == 0) {
                self.lastSelectionButton = button
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.titleLabel.sizeToFit()
        let width = CGRectGetWidth(titleLabel.frame)
        titleLabel.frame = CGRect(x: 20, y: 0, width: width, height: 14)
        titleLabel.center.y = CGRectGetHeight(self.frame) / 2.0
        guard let buttons = self.buttons else { return }
        let x = CGRectGetWidth(self.frame) - buttonWidth * CGFloat(buttons.count)
        for (index, button) in buttons.enumerate() {
            button.frame = CGRect(x: x + buttonWidth * CGFloat(index), y: 0, width: buttonWidth, height: buttonHeight)
            button.center.y = CGRectGetHeight(self.frame) / 2.0
            if button === self.lastSelectionButton {
                button.selected = true
            }
        }
    }
}

extension MusicHeaderView {
    @objc private func buttonClick(button: UIButton) {
        if button === self.lastSelectionButton { return }
        button.selected = true
        self.lastSelectionButton!.selected = false
        self.lastSelectionButton = button
        self.delegate?.headerView?(self, selectedAtIndex: button.tag - baseTag)
    }
}

extension MusicHeaderView {
    func setTitle(title: String) {
        self.titleLabel.text = title
        setNeedsLayout()
    }
}
