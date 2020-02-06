//
//  BreweryEntity+CoreDataProperties.swift
//  Breweries
//
//  Created by Vladislav Horbenko on 06.02.2020.
//  Copyright © 2020 VladislavGorbenko. All rights reserved.
//
//

import Foundation
import CoreData


extension BreweryEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BreweryEntity> {
        return NSFetchRequest<BreweryEntity>(entityName: "BreweryEntity")
    }

    @NSManaged public var id: Int32
    @NSManaged public var name: String?
    @NSManaged public var type: String?
    @NSManaged public var street: String?
    @NSManaged public var city: String?
    @NSManaged public var state: String?
    @NSManaged public var postalCode: String?
    @NSManaged public var country: String?
    @NSManaged public var longitude: String?
    @NSManaged public var latitude: String?
    @NSManaged public var phone: String?
    @NSManaged public var website: String?

}
