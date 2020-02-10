//
//  ViewController.swift
//  Breweries
//
//  Created by Vladislav Horbenko on 05.02.2020.
//  Copyright © 2020 VladislavGorbenko. All rights reserved.
//

import UIKit

class ListOfBreweriesVC: UIViewController {

    @IBOutlet weak var breweriesTableView: UITableView!
    private let searchController = UISearchController(searchResultsController: nil)
    private let tableVM = BreweryTableVM()
    //private var filteredBreweries = [Brewery]()
    
//    private var searchBarIsEmpty: Bool {
//        guard let text = searchController.searchBar.text else {return false}
//        return text.isEmpty
//    }
//
//    private var isFiltering:Bool {
//        return searchController.isActive && !searchBarIsEmpty
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Breweries"
        self.breweriesTableView.delegate = self.tableVM
        self.breweriesTableView.dataSource = self.tableVM
        settingSearchController()
        
        let mainNib = UINib(nibName: "MainBreweryTVC", bundle: nil)
        breweriesTableView.register(mainNib, forCellReuseIdentifier: "MainBreweryTVC")
        
        let supportNib = UINib(nibName: "SupportBreweryTVC", bundle: nil)
        breweriesTableView.register(supportNib, forCellReuseIdentifier: "SupportBreweryTVC")
        
    }

    
    private func settingSearchController() {
        self.searchController.searchResultsUpdater = self
        self.searchController.obscuresBackgroundDuringPresentation = false
        self.searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = self.searchController
        navigationItem.searchController?.isActive = true
        definesPresentationContext = false
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.172368288, green: 0.5335530043, blue: 0.01537404489, alpha: 0.5)
    }
    
}

//extension ListOfBreweriesVC: UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating {
////table's protocols
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if isFiltering {
//            return modelCell.fetchTypeOfCells(countOfBreweries: filteredBreweries.count).count
//        }
//        if let breweries = self.breweries {
//            return modelCell.fetchTypeOfCells(countOfBreweries: breweries.count).count
//        } else {
//            return 0
//        }
//    }
//
//    fileprivate func setDataForCell(_ model: TypeOfCell, _ brewery: inout Brewery, _ indexPath: IndexPath, _ tableView: UITableView) {
//
//        var model: TypeOfCell
//        if model == .mainCell {
//            brewery = filteredBreweries[indexPath.row]
//            let cell = tableView.dequeueReusableCell(withIdentifier: "MainBreweryTVC") as! MainBreweryTVC
//            cell.setDataForCell(brewery: brewery)
//        } else {
//            brewery = filteredBreweries[indexPath.row - 1]
//            let cell = tableView.dequeueReusableCell(withIdentifier: "SupportBreweryTVC") as! SupportBreweryTVC
//            cell.setDataForCell(brewery: brewery)
//        }
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let filteredModels = modelCell.fetchTypeOfCells(countOfBreweries: filteredBreweries.count)
//        let models = modelCell.fetchTypeOfCells(countOfBreweries: breweries?.count ?? 0)
//        var brewery: Brewery
//
//        if isFiltering {
//            model = filteredModels[indexPath.row]
//            setDataForCell(model, &brewery, indexPath, tableView)
//        } else if let breweries = self.breweries {
//            brewery = breweries[indexPath.row]
//        } else {
//            brewery = Brewery()
//        }
//        return UITableViewCell()
//    }
//
//// searchbar'es protocol
//    func updateSearchResults(for searchController: UISearchController) {
//        filterContentForSearchText(text: searchController.searchBar.text!)
//        breweriesTableView.reloadData()
//    }
//
//    private func filterContentForSearchText (text: String) {
//        guard let breweries = self.breweries else {return}
//        filteredBreweries = breweries.filter({ (brewery) -> Bool in
//            return (brewery.name?.lowercased().contains(text.lowercased()) ?? false)
//        })
//
//    }
//
//}
//
