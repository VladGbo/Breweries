//
//  BreweryMapVM.swift
//  Breweries
//
//  Created by Vladislav Horbenko on 11.02.2020.
//  Copyright © 2020 VladislavGorbenko. All rights reserved.
//

import Foundation


class BreweryMapVM {
    
    var latitude: String
    var longitude: String
    var title: String
    var subTitle: String
    
    
    init(latitude: String,
         longitude: String,
         title: String,
         subTitle: String) {
        self.latitude = latitude
        self.longitude = longitude
        self.title = title
        self.subTitle = subTitle
    }
}
