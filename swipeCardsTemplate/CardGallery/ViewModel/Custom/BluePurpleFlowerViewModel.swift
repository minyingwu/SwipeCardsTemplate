//
//  BluePurpleFlowerViewModel.swift
//  swipeCardsTemplate
//
//  Created by Victor on 2018/6/8.
//  Copyright © 2018 Victor. All rights reserved.
//

import UIKit

class BluePurpleFlowerViewModel: CardViewModel {
    override func fetchCardsfromServer() {
        cardsData = [BluePurpleFlower(title: "Common Foxglove",
                                      image: UIImage(named: "thumb_image_4752121")!),
                     BluePurpleFlower(title: "Mona Lavender",
                                      image: UIImage(named: "thumb_image_5453351")!),
                     BluePurpleFlower(title: "Angel flower",
                                      image: UIImage(named: "thumb_image_6710831")!),
                     BluePurpleFlower(title: "Common Fuchsia",
                                      image: UIImage(named: "thumb_image_8030240")!),
                     BluePurpleFlower(title: "Fireworks Flower",
                                      image: UIImage(named: "thumb_image_8242162")!)]
    }
    
    override func getUpdatedCardCell(at indexPath: IndexPath,
                                     _ cell: UICollectionViewCell) -> UICollectionViewCell {
        if let bluePurpleFlowerCell = cell as? BluePurpleFlowerCell {
            let extendedData = extendedBoundaryCardsData[indexPath.row] as! BluePurpleFlower
            bluePurpleFlowerCell.mButton.setTitle(extendedData.title, for: .normal)
            bluePurpleFlowerCell.mImageView.image = extendedData.image
            
            return bluePurpleFlowerCell
        }
        return cell
    }
}

struct BluePurpleFlower: CardData {
    let title: String
    let image: UIImage
}

