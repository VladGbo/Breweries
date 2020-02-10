//
//  SearchBarVM.swift
//  Breweries
//
//  Created by Vladislav Horbenko on 10.02.2020.
//  Copyright © 2020 VladislavGorbenko. All rights reserved.
//

import Foundation
import UIKit


class SearchBarVM: NSObject {
    

    private var filteredBreweries = [Brewery]()
        
        private var searchBarIsEmpty: Bool {
            guard let text = searchController.searchBar.text else {return false}
            return text.isEmpty
        }
    
        private var isFiltering:Bool {
            return searchController.isActive && !searchBarIsEmpty
        }
    
}

extension SearchBarVM: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        <#code#>
    }
    
    
    
    
}

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
