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
    private var filteredBreweries = [Brewery]()
    private let breweries = BreweriesManager.shared.breweries
    
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else {return false}
        return text.isEmpty
    }
    
    private var isFiltering:Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Breweries"
        self.breweriesTableView.delegate = self
        self.breweriesTableView.dataSource = self
        settingSearchController()
        
        
    }

    
    private func settingSearchController() {
        self.searchController.searchResultsUpdater = self
        self.searchController.obscuresBackgroundDuringPresentation = false
        self.searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = self.searchController
        definesPresentationContext = true
    }
    
}

extension ListOfBreweriesVC: UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating {
//table's protocols
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredBreweries.count
        }
        return breweries?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var brewery: Brewery
        if isFiltering {
            brewery = filteredBreweries[indexPath.row]
        } else if let breweries = self.breweries {
            brewery = breweries[indexPath.row]
        } else {
            brewery = Brewery()
        }
        return UITableViewCell()
    }
    
// searchbar'es protocol
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(text: searchController.searchBar.text!)
        breweriesTableView.reloadData()
    }
    
    private func filterContentForSearchText (text: String) {
        guard let breweries = self.breweries else {return}
        filteredBreweries = breweries.filter({ (brewery) -> Bool in
            return (brewery.name?.lowercased().contains(text.lowercased()) ?? false)
        })
        
    }
    
}

