//
//  SupportBreweryCellVM.swift
//  Breweries
//
//  Created by Vladislav Horbenko on 08.02.2020.
//  Copyright © 2020 VladislavGorbenko. All rights reserved.
//

import Foundation

class SupportBreweryCellVM: BreweryCellProtocol {
    
    var nameOfCompany: String
    var country: String
    var state: String
    var city: String
    var street: String
    
    init(nameOfCompany: String,
         country: String,
         state: String,
         city: String,
         street: String) {
        
        self.nameOfCompany = nameOfCompany
        self.country = country
        self.state = state
        self.city = city
        self.street = street
    }
    
    var type: TypeOfCell {
        return .supportCell
    }
    
    var nameInBundle: String {
        return "SupportBreweryTVC"
    }
    
}
