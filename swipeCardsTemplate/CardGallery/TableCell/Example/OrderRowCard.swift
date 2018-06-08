//
//  OrderRowCard.swift
//  swipeCardsTemplate
//
//  Created by Victor on 2018/6/8.
//  Copyright © 2018 Victor. All rights reserved.
//

import UIKit

class OrderRowCard: BaseRowCard {
    fileprivate lazy var orderViewModel: CardViewModel = {
        return OrderCardViewModel()
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setupViewModel() {
        cardViewModel = orderViewModel
        orderViewModel.showAlertClosure = { [weak self] in
            
        }
        
        orderViewModel.updateLoadingClosure = { [weak self] in
            
        }
        
        orderViewModel.reloadUIClosure = { [weak self] in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                self?.mCollectionView.reloadData()
                self?.mPageControl.numberOfPages = self?.orderViewModel.numberOfCards ?? 0
                self?.scroll(to: 0)
            }
        }
        orderViewModel.fetchCardsfromServer()
    }
}

extension OrderRowCard: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return orderViewModel.numberOfExtendedBoundaryCards
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let orderCell = collectionView.dequeueReusableCell(withReuseIdentifier: "order_cell", for: indexPath) as! OrderCell
        return orderViewModel.getUpdatedCardCell(at: indexPath, orderCell)
    }
}
