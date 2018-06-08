//
//  OrderCardViewModel.swift
//  swipeCardsTemplate
//
//  Created by Victor on 2018/6/8.
//  Copyright © 2018 Victor. All rights reserved.
//

import UIKit

class OrderCardViewModel: CardViewModel {
    override func fetchCardsfromServer() {
        cardsData = [Order(title: "Order1"), Order(title: "Order2"),
                       Order(title: "Order3"), Order(title: "Order4"),
                       Order(title: "Order5"), Order(title: "Order6")]
    }
    
    override func getUpdatedCardCell(at indexPath: IndexPath,
                                     _ cell: UICollectionViewCell) -> UICollectionViewCell {
        if let orderCell = cell as? OrderCell {
            let extendedData = extendedBoundaryCardsData[indexPath.row] as! Order
            orderCell.mButton.setTitle(extendedData.title, for: .normal)
            return orderCell
        }
        return cell
    }
}

struct Order: CardData {
    let title: String
}
