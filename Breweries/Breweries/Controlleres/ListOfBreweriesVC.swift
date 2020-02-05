//
//  ViewController.swift
//  Breweries
//
//  Created by Vladislav Horbenko on 05.02.2020.
//  Copyright © 2020 VladislavGorbenko. All rights reserved.
//

import UIKit

class ListOfBreweriesVC: UIViewController {

    @IBOutlet weak var breweriesSearchBar: UISearchBar!
    @IBOutlet weak var breweriesTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Breweries"
        self.breweriesTableView.delegate = self
        self.breweriesTableView.dataSource = self
        
    }


}

extension ListOfBreweriesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
    
    
}

