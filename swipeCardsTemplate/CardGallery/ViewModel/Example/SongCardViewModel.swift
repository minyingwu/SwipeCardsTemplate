//
//  SongCardViewModel.swift
//  swipeCardsTemplate
//
//  Created by Victor on 2018/6/8.
//  Copyright © 2018 Victor. All rights reserved.
//

import UIKit

class SongCardViewModel: CardViewModel {
    override func fetchCardsfromServer() {
        cardsData = [Song(title: "Song1"), Song(title: "Song2"),
                       Song(title: "Song3"), Song(title: "Song4"),
                       Song(title: "Song5")]
    }
    
    override func getUpdatedCardCell(at indexPath: IndexPath,
                                     _ cell: UICollectionViewCell) -> UICollectionViewCell {
        if let songCell = cell as? SongCell {
            let extendedData = extendedBoundaryCardsData[indexPath.row] as! Song
            songCell.mButton.setTitle(extendedData.title, for: .normal)
            return songCell
        }
        return cell
    }
}

struct Song: CardData {
    let title: String
}

