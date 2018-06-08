//
//  CardViewModel.swift
//  swipeCardsTemplate
//
//  Created by Victor on 2018/6/6.
//  Copyright © 2018 Victor. All rights reserved.
//

import UIKit

protocol CardData {}

class CardViewModel {
    // Original card's data
    var cardsData: [CardData] = [CardData]() {
        didSet {
            extendedBoundaryCardsData.removeAll()
            extendedBoundaryCardsData = cardsData
            self.appendBoundaryElements()
            self.reloadUIClosure?()
        }
    }
    
    // Extended boundary to support infiniting loop card's data
    var extendedBoundaryCardsData: [CardData] = []
    
    // Card's data count
    var numberOfCards: Int {
        return cardsData.count
    }
    
    // Extended boundary card's data count
    var numberOfExtendedBoundaryCards: Int {
        return extendedBoundaryCardsData.count
    }
    
    var showAlertClosure: (()->())?
    
    var reloadUIClosure: (()->())?
    
    var updateLoadingClosure: (()->())?
    
    func fetchCardsfromServer() {
        fatalError("Must override this method to fetch different card's data")
    }
    
    func getUpdatedCardCell(at indexPath: IndexPath, _ cell: UICollectionViewCell) -> UICollectionViewCell {
        fatalError("Must override this method to handle custom card's cell")
    }
    
    func getCardData(at index: Int) -> CardData? {
        return cardsData[index]
    }
    
    func getExtendedBoundaryCardData(at index: Int) -> CardData? {
        return extendedBoundaryCardsData[index]
    }
    
    private func appendBoundaryElements() {
        // Add leading boundary
        extendedBoundaryCardsData.insert(cardsData[numberOfCards - 1], at: 0)
        // Add trailing boundary
        extendedBoundaryCardsData.append(cardsData[0])
    }
}
