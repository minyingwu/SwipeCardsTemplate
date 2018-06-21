//
//  WhiteFlowerRowCard
//  swipeCardsTemplate
//
//  Created by Victor on 2018/6/8.
//  Copyright © 2018 Victor. All rights reserved.
//

import UIKit

class WhiteFlowerRowCard: BaseRowCard {
    fileprivate lazy var whiteFlowerViewModel: CardViewModel = {
        return WhiteFlowerViewModel()
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setupViewModel() {
        cardViewModel = whiteFlowerViewModel
        whiteFlowerViewModel.showAlertClosure = { [weak self] in
            
        }
        
        whiteFlowerViewModel.updateLoadingClosure = { [weak self] in
            
        }
        
        whiteFlowerViewModel.reloadUIClosure = { [weak self] in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                self?.mCollectionView.reloadData()
                self?.mPageControl.numberOfPages = self?.whiteFlowerViewModel.numberOfCards ?? 0
                self?.scroll(to: 0)
            }
        }
        whiteFlowerViewModel.fetchCardsfromServer()
    }
}

extension WhiteFlowerRowCard: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return whiteFlowerViewModel.numberOfExtendedBoundaryCards
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let whiteFlowerCell = collectionView.dequeueReusableCell(withReuseIdentifier: "white_flower_cell", for: indexPath) as! WhiteFlowerCell
        return whiteFlowerViewModel.getUpdatedCardCell(at: indexPath, whiteFlowerCell)
    }
}
