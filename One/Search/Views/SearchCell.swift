//
//  SearchCell.swift
//  One
//
//  Created by Hu on 16/9/6.
//  Copyright © 2016年 redye. All rights reserved.
//

import UIKit

class SearchCell: UITableViewCell {
    
    private var avtorImageView: UIImageView!
    private var titleLabel: UILabel!
    private var detailLabal: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let height = CGRectGetHeight(self.frame) - 16
        self.avtorImageView.frame = CGRect(x: 15, y: 8, width: height, height: height)
        let x = CGRectGetMaxX(self.avtorImageView.frame) + 10
        let width = CGRectGetWidth(self.frame) - x - 60
        self.titleLabel.frame = CGRect(x: x, y: 8, width: width, height: height / 2.0)
        let y = CGRectGetMaxY(self.titleLabel.frame)
        self.detailLabal.frame = CGRect(x: x, y: y, width: width, height: height / 2.0)
    }
    
    private func setUI() {
        self.selectionStyle = .None
        self.accessoryType = .DisclosureIndicator
        
        avtorImageView = UIImageView()
        avtorImageView.contentMode = .ScaleAspectFill
        avtorImageView.clipsToBounds = true
        self.contentView.addSubview(avtorImageView)
        
        titleLabel = UILabel()
        titleLabel.font = UIFont.systemFontOfScaleSize(size: 13.0)
        self.contentView.addSubview(titleLabel)
        
        detailLabal = UILabel()
        detailLabal.font = UIFont.systemFontOfScaleSize(size: 16.0)
        detailLabal.textColor = UIColor.colorWithHexString("#060606")
        self.contentView.addSubview(detailLabal)
    }
    
    func updateWithAna(ana ana: Ana?) {
        guard let ana = ana else { return }
        let url = NSURL(string: ana.hpImgUrl!)
        self.avtorImageView.kf_setImageWithURL(url)
        self.titleLabel.text = ana.hpTitle
        self.detailLabal.text = ana.hpContent
    }
    
    func updateWithMusic(music music: Music?) {
        guard let music = music else { return }
        let url = NSURL(string: music.cover!)
        self.avtorImageView.kf_setImageWithURL(url)
        self.titleLabel.text = music.title
        self.detailLabal.text = music.author?.userName
    }
    
    func updateWithAuthor(author author: Author?) {
        guard let author = author else { return }
        let url = NSURL(string: author.webURL!)
        self.avtorImageView.kf_setImageWithURL(url)
        self.titleLabel.text = author.userName
        self.detailLabal.text = author.desc
    }

}
