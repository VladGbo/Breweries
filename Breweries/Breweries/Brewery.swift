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
    
    init(id: Int?,
         name: String?,
         type: String?,
         street: String?,
         city: String?,
         state: String?,
         postalCode: String?,
         country: String?,
         longitude: String?,
         latitude: String?,
         phone: String?,
         website: String?) {
        
        self.id = id
        self.name = name
        self.type = type
        self.street = street
        self.city = city
        self.state = state
        self.postalCode = postalCode
        self.country = country
        self.longitude = longitude
        self.latitude = latitude
        self.phone  = phone
        self.website = website
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
