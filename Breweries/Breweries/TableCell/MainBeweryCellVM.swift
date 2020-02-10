//
//  MainBeweryVM.swift
//  Breweries
//
//  Created by Vladislav Horbenko on 08.02.2020.
//  Copyright © 2020 VladislavGorbenko. All rights reserved.
//

import Foundation
class MainBeweryCellVM: BreweryCellProtocol {
    
    var nameOfCompany: String
    var phoneNumber: String
    var website: String
    
    init(nameOfCompany: String,
         phoneNumber: String,
         website: String) {
        self.nameOfCompany = nameOfCompany
        self.phoneNumber = phoneNumber
        self.website = website
    }
    
    var type: TypeOfCell {
        return .mainCell
    }
    
    var nameInBundle: String {
        return "MainBreweryTVC"
    }
}
