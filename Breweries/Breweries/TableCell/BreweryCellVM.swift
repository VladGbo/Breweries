//
//  BreweryCellVm.swift
//  Breweries
//
//  Created by Vladislav Horbenko on 08.02.2020.
//  Copyright © 2020 VladislavGorbenko. All rights reserved.
//

import Foundation

class BreweryCellVM {
    
    var cellsVM = [BreweryCellProtocol]()
    private let breweries: [Brewery]
    
    init (breweries: [Brewery]) {
        self.breweries = breweries
        setDataForCells()
    }
    
    
    private func setDataForCells() {
        
        breweries.forEach { (brewery) in
            
            if let name = brewery.name,
                let phone = brewery.phone,
                let website = brewery.website {
            
                let mainCellVM = MainBeweryCellVM(nameOfCompany: name, phoneNumber: phone, website: website)
                cellsVM.append(mainCellVM)
            }
            
            if let name = brewery.name,
                let country = brewery.country,
                let state = brewery.state,
                let city = brewery.city,
                let street = brewery.street,
                let longitude = brewery.longitude,
                let latitude = brewery.latitude{
                
                let supportCellVM = SupportBreweryCellVM (nameOfCompany: name,
                                                          country: country,
                                                          state: state,
                                                          city: city,
                                                          street: street,
                                                          longitude: longitude,
                                                          latitude: latitude)
                cellsVM.append(supportCellVM)
            }
            
        }
        
    }
    
}
