//
//  BreweryTableVM.swift
//  Breweries
//
//  Created by Vladislav Horbenko on 09.02.2020.
//  Copyright © 2020 VladislavGorbenko. All rights reserved.
//

import Foundation
import UIKit

class BreweryTableVM: NSObject{
    
    private var breweries: [Brewery]
    private var cellsVM: BreweryCellVM
    var searchResultUpdating = SearchBarVM()
    
    override init() {
        breweries = BreweriesManager.shared.breweries ?? [Brewery]()
        cellsVM = BreweryCellVM(breweries: breweries)
    }
    
    func updateCellsModel (breweries: [Brewery]) {
        cellsVM = BreweryCellVM(breweries: breweries)
    }
    
}

extension BreweryTableVM: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if searchResultUpdating.isFiltering {
            updateCellsModel(breweries: searchResultUpdating.filteredBreweries)
        } else {
            updateCellsModel(breweries: self.breweries)
        }
        return cellsVM.cellsVM.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 16
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = cellsVM.cellsVM[indexPath.section]
        switch model.type {
        case .mainCell:
            if let cell = tableView.dequeueReusableCell(withIdentifier: model.nameInBundle) as? MainBreweryTVC {
                cell.cellVM = model
                return cell
            }
        case .supportCell:
            if let cell = tableView.dequeueReusableCell(withIdentifier: model.nameInBundle) as? SupportBreweryTVC {
                cell.cellVM = model
                return cell
            }
        }
        return UITableViewCell()
    }
    
}
