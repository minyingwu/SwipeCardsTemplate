//
//  WhiteFlowerViewModel.swift
//  swipeCardsTemplate
//
//  Created by Victor on 2018/6/8.
//  Copyright © 2018 Victor. All rights reserved.
//

import UIKit

class WhiteFlowerViewModel: CardViewModel {
    override func fetchCardsfromServer() {
        cardsData = [WhiteFlower(title: "Jasmine",
                                 image: UIImage(named: "thumb_image_1327210")!),
                     WhiteFlower(title: "Garland Flower",
                                 image: UIImage(named: "thumb_image_1876164")!),
                     WhiteFlower(title: "SnowFlake",
                                 image: UIImage(named: "thumb_image_9273936")!)]
    }
    
    override func getUpdatedCardCell(at indexPath: IndexPath,
                                     _ cell: UICollectionViewCell) -> UICollectionViewCell {
        if let whiteFlowerCell = cell as? WhiteFlowerCell {
            let extendedData = extendedBoundaryCardsData[indexPath.row] as! WhiteFlower
            whiteFlowerCell.mLabel.text = extendedData.title
            whiteFlowerCell.mButton.isHidden = true
            whiteFlowerCell.mImageView.image = extendedData.image
            
            return whiteFlowerCell
        }
        return cell
    }
}

struct WhiteFlower: CardData {
    let title: String
    let image: UIImage
}
