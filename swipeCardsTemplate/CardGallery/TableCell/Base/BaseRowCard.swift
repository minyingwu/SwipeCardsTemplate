//
//  BaseRowCard.swift
//  swipeCardsTemplate
//
//  Created by Victor on 2018/6/6.
//  Copyright © 2018 Victor. All rights reserved.
//

import UIKit

protocol TableCellStateChangedDelegate: class {
    func showAlert()
    func updateLoading()
    func forwardNextPage()
}

class BaseRowCard: UITableViewCell {
    @IBOutlet weak var mCollectionView: UICollectionView!
    
    @IBOutlet weak var mPageControl: UIPageControl!
    
    @IBOutlet weak var mCollectionViewRightWidth: NSLayoutConstraint!
    
    @IBOutlet weak var mCollectionViewLeftWidth: NSLayoutConstraint!
    
    internal var cardViewModel: CardViewModel!
    
    internal weak var delegate: TableCellStateChangedDelegate?
    
    internal var startAutoIndex: Int = 1
    
    fileprivate var cellWidth: CGFloat!
    
    fileprivate func indexofEndDraggingCell() -> Int {
        return Int(round(mCollectionView.contentOffset.x / cellWidth))
    }
    
    private let INIT_PAGE_NUM = 3
    
    private var autoScrollTimer: Timer?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initUI()
        setupViewModel()
    }
    
    private func initUI() {
        // Initialize page collectionview by page scrolling
        mCollectionView.isPagingEnabled = true
        
        // Initialize pageControl
        mPageControl.currentPage = 0
        mPageControl.numberOfPages = Int(INIT_PAGE_NUM)
        
        // Optional
        mPageControl.pageIndicatorTintColor = .white
        mPageControl.currentPageIndicatorTintColor = .yellow
    }
    
    func setupViewModel() {
        fatalError("Must override this method to set different viewModel")
    }
    
    func scroll(to index: Int) {
        // IndexPath has changed bt update boundary elements
        let indexPath = IndexPath(item: index + 1, section: 0)
        mCollectionView.scrollToItem(at: indexPath, at: .left, animated: false)
        startAutoSwipe(at: index + 1, with: true)
    }
    
    fileprivate func startAutoSwipe(at index: Int, with isReset: Bool) {
        self.startAutoIndex = index
        if isReset {
            autoScrollTimer?.invalidate()
            startGlobalAutoSwipe()
        }
    }
    
    private func startGlobalAutoSwipe() {
        let numberOfModels = self.cardViewModel.numberOfCards
        autoScrollTimer = Timer.scheduledTimer(withTimeInterval: 6.0, repeats: true) { _ in
            DispatchQueue.main.async {
                let indexPath = IndexPath(item: self.startAutoIndex, section: 0)
//                print("Index: \(indexPath)")
                self.mCollectionView.scrollToItem(at: indexPath, at: .left, animated: true)
                self.mPageControl.currentPage = self.startAutoIndex - 1 == numberOfModels ? 0 : self.startAutoIndex - 1
                self.startAutoIndex = self.startAutoIndex <= numberOfModels ? self.startAutoIndex + 1 : self.startAutoIndex - numberOfModels + 1
            }
        }
    }
}

extension BaseRowCard: UICollectionViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        var visibleRect = CGRect()
        visibleRect.origin = mCollectionView.contentOffset
        visibleRect.size = mCollectionView.bounds.size
        
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        guard let indexPath = mCollectionView.indexPathForItem(at: visiblePoint) else {
            return
        }
        
        // Determine page index
        mPageControl.currentPage = indexPath.row - 1
        startAutoSwipe(at: indexPath.row, with: false)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollContentSize = mCollectionView.contentSize.width
        let boundarySize: CGFloat = cellWidth
        let contentOffset = scrollView.contentOffset.x
        if contentOffset >= (scrollContentSize - boundarySize) {
            scrollView.contentOffset = CGPoint(x: boundarySize, y: 0)
        }else if contentOffset <= 0 {
            let boundaryLessSize = CGFloat(cardViewModel.numberOfCards) * cellWidth
            scrollView.contentOffset = CGPoint(x: boundaryLessSize, y: 0)
        }
    }
}

extension BaseRowCard: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = UIScreen.main.bounds.size.width -
            (mCollectionViewLeftWidth.constant + mCollectionViewRightWidth.constant)
        self.cellWidth = cellWidth
        return CGSize(width: cellWidth, height: collectionView.bounds.size.height)
    }
}
