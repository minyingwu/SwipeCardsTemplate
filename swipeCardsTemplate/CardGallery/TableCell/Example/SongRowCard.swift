//
//  SongRowCard.swift
//  swipeCardsTemplate
//
//  Created by Victor on 2018/6/8.
//  Copyright © 2018 Victor. All rights reserved.
//

import UIKit

class SongRowCard: BaseRowCard {
    fileprivate lazy var songViewModel: CardViewModel = {
        return SongCardViewModel()
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setupViewModel() {
        cardViewModel = songViewModel
        songViewModel.showAlertClosure = { [weak self] in
            
        }
        
        songViewModel.updateLoadingClosure = { [weak self] in
            
        }
        
        songViewModel.reloadUIClosure = { [weak self] in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                self?.mCollectionView.reloadData()
                self?.mPageControl.numberOfPages = self?.songViewModel.numberOfCards ?? 0
                self?.scroll(to: 0)
            }
        }
        songViewModel.fetchCardsfromServer()
    }
}

extension SongRowCard: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return songViewModel.numberOfExtendedBoundaryCards
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let songCell = collectionView.dequeueReusableCell(withReuseIdentifier: "song_cell", for: indexPath) as! SongCell
        return songViewModel.getUpdatedCardCell(at: indexPath, songCell)
    }
}
