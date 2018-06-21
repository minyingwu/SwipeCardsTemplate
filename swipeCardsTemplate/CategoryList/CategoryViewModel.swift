//
//  CategoryViewModel.swift
//  swipeCardsTemplate
//
//  Created by Victor on 2018/6/6.
//  Copyright © 2018 Victor. All rights reserved.
//

import UIKit

class CategoryViewModel {
    private var mCategoryModels: [CategoryModel] = [CategoryModel]() {
        didSet {
            self.reloadTableClosure?()
        }
    }
    
    var numberOfCells: Int {
        return mCategoryModels.count
    }
    
    var showAlertClosure: (()->())?
    
    var reloadTableClosure: (()->())?
    
    var updateLoadingClosure: (()->())?
    
    func setCategories() {
        mCategoryModels = [CategoryModel(headerTitle: "Blue Purple"),
                           CategoryModel(headerTitle: "Pink"),
                           CategoryModel(headerTitle: "White")]
    }
    
    func getCategory(at index: Int) -> CategoryModel? {
        return mCategoryModels[index]
    }
}

struct CategoryModel {
    let headerTitle: String
    let itemTitle: [String]? = nil
}
