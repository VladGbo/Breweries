//
//  BreweriesManager.swift
//  Breweries
//
//  Created by Vladislav Horbenko on 06.02.2020.
//  Copyright © 2020 VladislavGorbenko. All rights reserved.
//

import Foundation

class BreweriesManager {
    
    static let shared = BreweriesManager()
    private init () {}
    
    var breweries: [Brewery]?
    func fetchBreweries () {
        NetworkService.shared.requestFetchListOfBreweries { (breweries, error) in
            if let breweries = breweries {
                self.breweries = breweries
                PersistenceService.shared.updateBreweriesCoreData(breweries: breweries)
            } else {
                PersistenceService.shared.fetchFromPersistenceStore { (persistenceBreweries, error) in
                    if let persistenceBreweries = persistenceBreweries {
                        self.breweries = persistenceBreweries
                    } else {
                        self.breweries = [Brewery]()
                    }
                }
            }
            
            if let _ = error {
                self.breweries = [Brewery]()
            }
        }
    }
    
}
