//
//  BluePurpleFlowerRowCard.swift
//  swipeCardsTemplate
//
//  Created by Victor on 2018/6/8.
//  Copyright © 2018 Victor. All rights reserved.
//

import UIKit

class BluePurpleFlowerRowCard: BaseRowCard {
    fileprivate lazy var bluePurpleFlowerViewModel: CardViewModel = {
        return BluePurpleFlowerViewModel()
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setupViewModel() {
        cardViewModel = bluePurpleFlowerViewModel
        bluePurpleFlowerViewModel.showAlertClosure = { [weak self] in
            
        }
        
        bluePurpleFlowerViewModel.updateLoadingClosure = { [weak self] in
            
        }
        
        bluePurpleFlowerViewModel.reloadUIClosure = { [weak self] in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                self?.mCollectionView.reloadData()
                self?.mPageControl.numberOfPages = self?.bluePurpleFlowerViewModel.numberOfCards ?? 0
                self?.scroll(to: 0)
            }
        }
        bluePurpleFlowerViewModel.fetchCardsfromServer()
    }
}

extension BluePurpleFlowerRowCard: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return bluePurpleFlowerViewModel.numberOfExtendedBoundaryCards
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let bluePurpleFlowerCell = collectionView.dequeueReusableCell(withReuseIdentifier: "blue_purple_flower_cell", for: indexPath) as! BluePurpleFlowerCell
        return bluePurpleFlowerViewModel.getUpdatedCardCell(at: indexPath, bluePurpleFlowerCell)
    }
}
