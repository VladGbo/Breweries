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
    
    typealias Result = ([Brewery])->Void
    
    var breweries: [Brewery]?
    func fetchBreweries (complitionResult:@escaping Result) {
        NetworkService.shared.requestFetchListOfBreweries { (breweries, error) in
            if let breweries = breweries {
                self.breweries = breweries
                complitionResult(breweries)
                PersistenceService.shared.updateBreweriesCoreData(breweries: breweries)
            } else {
                PersistenceService.shared.fetchFromPersistenceStore { (persistenceBreweries, error) in
                    if let persistenceBreweries = persistenceBreweries {
                        self.breweries = persistenceBreweries
                        complitionResult(persistenceBreweries)
                    }
                }
            }
            if let _ = error {
                complitionResult([Brewery]())
            }
        }
    }
    
}
