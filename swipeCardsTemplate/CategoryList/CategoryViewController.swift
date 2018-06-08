//
//  CategoryViewController.swift
//  swipeCardsTemplate
//
//  Created by Victor on 2018/6/6.
//  Copyright © 2018 Victor. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
    @IBOutlet weak var mTableView: UITableView!
    
    fileprivate lazy var categoryViewModel: CategoryViewModel = {
        return CategoryViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mTableView.separatorStyle = .none
        setupViewModel()
    }
    
    private func setupViewModel() {
        categoryViewModel.showAlertClosure = { [weak self] in
            
        }
        
        categoryViewModel.updateLoadingClosure = { [weak self] in
            
        }
        
        categoryViewModel.reloadTableClosure = { [weak self] in
            DispatchQueue.main.async {
                self?.mTableView.reloadData()
            }
        }
        
        categoryViewModel.setCategories()
    }
}

extension CategoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}

extension CategoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return categoryViewModel.getCategory(at: section)?.headerTitle
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return categoryViewModel.numberOfCells
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "song_card") as! SongRowCard
            cell.selectionStyle = .none
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "order_card") as! OrderRowCard
            cell.selectionStyle = .none
            return cell
        default:
            return UITableViewCell()
        }
    }
}

