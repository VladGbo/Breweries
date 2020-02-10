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
    
    
    var filteredBreweries = [Brewery]()
    weak var delegate: SearchBarVMDelegate?
    
    var searchBarIsEmpty: Bool {
        guard let delegate = self.delegate else { return false }
        guard let text = delegate.brewerySearchController.searchBar.text else {return false}
        return text.isEmpty
    }
    
    var isFiltering:Bool {
        guard let delegate = self.delegate else { return false }
        return delegate.brewerySearchController.isActive && !searchBarIsEmpty
    }
    
}

extension SearchBarVM: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let delegate = self.delegate else { return }
        filterContentForSearchText(text: searchController.searchBar.text!)
        delegate.breweryBreweriesTableView.reloadData()
    }
    
    private func filterContentForSearchText (text: String) {
        guard let breweries = BreweriesManager.shared.breweries else { return }
        filteredBreweries = breweries.filter({ (brewery) -> Bool in
            return (brewery.name?.lowercased().contains(text.lowercased()) ?? false)
        })
    }
}
