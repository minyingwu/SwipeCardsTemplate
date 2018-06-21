//
//  PinkFlowerRowCard.swift
//  swipeCardsTemplate
//
//  Created by Victor on 2018/6/8.
//  Copyright © 2018 Victor. All rights reserved.
//

import UIKit

class PinkFlowerRowCard: BaseRowCard {
    fileprivate lazy var pinkFlowerViewModel: CardViewModel = {
        return PinkFlowerViewModel()
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setupViewModel() {
        cardViewModel = pinkFlowerViewModel
        pinkFlowerViewModel.showAlertClosure = { [weak self] in
            
        }
        
        pinkFlowerViewModel.updateLoadingClosure = { [weak self] in
            
        }
        
        pinkFlowerViewModel.reloadUIClosure = { [weak self] in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                self?.mCollectionView.reloadData()
                self?.mPageControl.numberOfPages = self?.pinkFlowerViewModel.numberOfCards ?? 0
                self?.scroll(to: 0)
            }
        }
        pinkFlowerViewModel.fetchCardsfromServer()
    }
}

extension PinkFlowerRowCard: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return pinkFlowerViewModel.numberOfExtendedBoundaryCards
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let pinkFlowerCell = collectionView.dequeueReusableCell(withReuseIdentifier: "pink_flower_cell", for: indexPath) as! PinkFlowerCell
        return pinkFlowerViewModel.getUpdatedCardCell(at: indexPath, pinkFlowerCell)
    }
}
