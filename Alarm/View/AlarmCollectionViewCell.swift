//
//  AlarmCollectionViewCell.swift
//  Alarm
//
//  Created by ShinSheungmin on 12/22/15.
//  Copyright © 2015 HappyEngineer. All rights reserved.
//

import UIKit

class AlarmCollectionViewCell: UICollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.layer.cornerRadius = 2
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.clearColor().CGColor
        contentView.layer.masksToBounds = true

        layer.backgroundColor = UIColor.whiteColor().CGColor
        layer.shadowColor = UIColor.grayColor().CGColor
        layer.shadowOffset = CGSizeMake(0, 2)
        layer.shadowRadius = 2
        layer.shadowOpacity = 1
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: contentView.layer.cornerRadius).CGPath
    }
}
