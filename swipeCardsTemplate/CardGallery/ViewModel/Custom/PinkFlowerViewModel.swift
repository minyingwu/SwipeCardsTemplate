//
//  PinkFlowerViewModel.swift
//  swipeCardsTemplate
//
//  Created by Victor on 2018/6/8.
//  Copyright © 2018 Victor. All rights reserved.
//

import UIKit

class PinkFlowerViewModel: CardViewModel {
    override func fetchCardsfromServer() {
        cardsData = [PinkFlower(title: "Floss-silk Tree", content: "play1",
                          image: UIImage(named: "thumb_image_1473050")!),
                     PinkFlower(title: "Ixora flower", content: "play2",
                          image: UIImage(named: "thumb_image_2381489")!),
                     PinkFlower(title: "Pinnate Mosquito Fern", content: "play3",
                          image: UIImage(named: "thumb_image_2471544")!),
                     PinkFlower(title: "Cherry tree", content: "play4",
                          image: UIImage(named: "thumb_image_5125489")!),
                     PinkFlower(title: "Cherry Blossom", content: "play5",
                          image: UIImage(named: "thumb_image_6664468")!),
                     PinkFlower(title: "Maries Azalea", content: "play6",
                          image: UIImage(named: "thumb_image_8983777")!)]
    }
    
    override func getUpdatedCardCell(at indexPath: IndexPath,
                                     _ cell: UICollectionViewCell) -> UICollectionViewCell {
        if let pinkFlowerCell = cell as? PinkFlowerCell {
            let extendedData = extendedBoundaryCardsData[indexPath.row] as! PinkFlower
            pinkFlowerCell.mLabel.text = extendedData.title
            pinkFlowerCell.mButton.isHidden = true
            pinkFlowerCell.mImageView.image = extendedData.image
            
            return pinkFlowerCell
        }
        return cell
    }
}

struct PinkFlower: CardData {
    let title: String
    let content: String
    let image: UIImage
}
