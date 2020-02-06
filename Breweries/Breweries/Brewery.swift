//
//  Brewery.swift
//  Breweries
//
//  Created by Vladislav Horbenko on 05.02.2020.
//  Copyright © 2020 VladislavGorbenko. All rights reserved.
//

import Foundation


struct Brewery: Codable {
    var id        : Int?
    var name      : String?
    var type      : String?
    var street    : String?
    var city      : String?
    var state     : String?
    var postalCode: String?
    var country   : String?
    var longitude : String?
    var latitude  : String?
    var phone     : String?
    var website   : String?
    
    init(entity: BreweryEntity) {
        
        self.id = Int(entity.id)
        self.name       = entity.name
        self.type       = entity.type
        self.street     = entity.street
        self.city       = entity.city
        self.state      = entity.state
        self.postalCode = entity.postalCode
        self.country    = entity.country
        self.longitude  = entity.longitude
        self.latitude   = entity.latitude
        self.phone      = entity.phone
        self.website    = entity.website
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case type       = "brewery_type"
        case street
        case city
        case state
        case postalCode = "postal_code"
        case country
        case longitude
        case latitude
        case phone
        case website    = "website_url"
    }
    
}
