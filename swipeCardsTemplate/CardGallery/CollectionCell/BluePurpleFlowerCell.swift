//
//  BluePurpleFlowerCell.swift
//  swipeCardsTemplate
//
//  Created by Victor on 2018/6/6.
//  Copyright © 2018 Victor. All rights reserved.
//

import UIKit

class BluePurpleFlowerCell: UICollectionViewCell {
    @IBOutlet weak var mImageView: UIImageView!
    
    @IBOutlet weak var mButton: UIButton!
    
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
