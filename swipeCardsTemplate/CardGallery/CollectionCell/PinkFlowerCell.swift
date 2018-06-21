//
//  PinkFlowerCell.swift
//  swipeCardsTemplate
//
//  Created by Victor on 2018/6/8.
//  Copyright © 2018 Victor. All rights reserved.
//

import UIKit

class PinkFlowerCell: UICollectionViewCell {
    @IBOutlet weak var mImageView: UIImageView!
    
    @IBOutlet weak var mButton: UIButton!
    
    @IBOutlet weak var mLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutIfNeeded()
        mImageView.layer.masksToBounds = true
        mImageView.layer.cornerRadius = 30
//        mImageView.layer.cornerRadius = mImageView.frame.height/2
    }
}
