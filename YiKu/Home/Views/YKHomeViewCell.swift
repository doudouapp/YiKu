//
//  YKHomeViewCell.swift
//  YiKu
//
//  Created by dangshuai on 2018/6/20.
//  Copyright © 2018年 dangshuai. All rights reserved.
//

import UIKit

class YKHomeViewCell: UITableViewCell {
    
    var avtarImageView : UIImageView!
    var userName : UILabel!
    var content  : UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        self.createSubviews()
    }
    
    func createSubviews(){
        avtarImageView = UIImageView.init(frame: CGRect.init(x: 14, y: 6, width: 30, height: 30))
        avtarImageView.backgroundColor = UIColor.lightGray
        self.contentView.addSubview(avtarImageView!)
        
        userName = UILabel.init(frame: CGRect.init(x: 50, y: 13, width: 310, height: 17))
        userName.font = UIFont.systemFont(ofSize: 16)
        userName.textColor = UIColor.init(red: 100/255.0, green: 100/255.0, blue: 100/255.0, alpha: 1)
        self.contentView.addSubview(userName!)
        
        let content_ = UILabel.init()
        content_.font = UIFont.systemFont(ofSize: 16)
        content_.textColor = UIColor.init(red: 51/255.0, green: 51/255.0, blue: 51/255.0, alpha: 1)
        content_.numberOfLines = 0
        self.contentView.addSubview(content_)
        content_.translatesAutoresizingMaskIntoConstraints = false
        
        
        let top = NSLayoutConstraint(item: content_, attribute: .top, relatedBy: .equal, toItem: self.contentView, attribute: .top, multiplier: 1.0, constant: 42)
        let bottom = NSLayoutConstraint(item: content_, attribute: .bottom, relatedBy: .equal, toItem: self.contentView, attribute: .bottom, multiplier: 1.0, constant: -10)
        let left = NSLayoutConstraint(item: content_, attribute: .left, relatedBy: .equal, toItem: self.contentView, attribute: .left, multiplier: 1.0, constant: 14)
        let right = NSLayoutConstraint(item: content_, attribute: .right, relatedBy: .equal, toItem: self.contentView, attribute: .right, multiplier: 1.0, constant: -14)
        self.contentView.addConstraints([top,bottom,left,right])
        content = content_
    }
}
