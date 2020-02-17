//
//  BreweryTableVM.swift
//  Breweries
//
//  Created by Vladislav Horbenko on 09.02.2020.
//  Copyright © 2020 VladislavGorbenko. All rights reserved.
//

import Foundation
import UIKit

protocol BreweryTableVMDelegate: AnyObject {
    var navController: UINavigationController { get }
}

class BreweryTableVM: NSObject{
    
    private var breweries: [Brewery]
    private var cellsVM: BreweryCellVM
    var searchResultUpdating = SearchBarVM()
    weak var delegate: BreweryTableVMDelegate?
    
    
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
                DispatchQueue.main.async {
                    cell.cellVM = model
                }
                cell.delegate = self
                return cell
            }
        case .supportCell:
            if let cell = tableView.dequeueReusableCell(withIdentifier: model.nameInBundle) as? SupportBreweryTVC {
                DispatchQueue.main.async {
                    cell.cellVM = model
                }
                cell.delegate = self
                return cell
            }
        }
        return UITableViewCell()
    }
    
}

extension BreweryTableVM: MainBreweryTVCDelegate {
    func didPresedWebsite(link: String) {
       // let attributedString = NSAttributedString.makeHiperLink(for: link, in: <#T##String#>, as: <#T##String#>)
        
    }
}

extension BreweryTableVM: SupportBreweryTVCDelegate {
    func didPressedOnMap(lat: String, lon: String, title: String, subTitle: String) {
        let model  = BreweryMapVM(latitude: lat, longitude: lon, title: title, subTitle: subTitle)
        
        guard let mapVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BreweryMapVC") as? BreweryMapVC else {return}
        mapVC.model = model
        self.delegate?.navController.pushViewController(mapVC, animated: true)
    }
}
