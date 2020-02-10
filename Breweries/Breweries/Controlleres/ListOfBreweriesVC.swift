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
    internal let searchController = UISearchController(searchResultsController: nil)
    private let tableVM = BreweryTableVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Breweries"
        self.breweriesTableView.delegate = self.tableVM
        self.breweriesTableView.dataSource = self.tableVM
        self.tableVM.searchResultUpdating.delegate = self
        settingSearchController()
        
        let mainNib = UINib(nibName: "MainBreweryTVC", bundle: nil)
        breweriesTableView.register(mainNib, forCellReuseIdentifier: "MainBreweryTVC")
        
        let supportNib = UINib(nibName: "SupportBreweryTVC", bundle: nil)
        breweriesTableView.register(supportNib, forCellReuseIdentifier: "SupportBreweryTVC")
    }

    private func settingSearchController() {
        self.searchController.searchResultsUpdater = tableVM.searchResultUpdating
        self.searchController.obscuresBackgroundDuringPresentation = false
        self.searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = self.searchController
        navigationItem.searchController?.isActive = true
        definesPresentationContext = false
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.172368288, green: 0.5335530043, blue: 0.01537404489, alpha: 0.5)
    }
    
}

extension ListOfBreweriesVC: SearchBarVMDelegate {
    var brewerySearchController  : UISearchController {
        return self.searchController
    }
    var breweryBreweriesTableView: UITableView {
        return self.breweriesTableView
    }
}
