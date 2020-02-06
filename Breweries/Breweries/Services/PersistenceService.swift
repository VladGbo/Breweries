//
//  CoreDataManager.swift
//  Breweries
//
//  Created by Vladislav Horbenko on 06.02.2020.
//  Copyright © 2020 VladislavGorbenko. All rights reserved.
//

import Foundation
import CoreData

class PersistenceService {
    
    static let shared =  PersistenceService()
    private init () {}
    private let entityName = "BreweryEntity"
    
    var context: NSManagedObjectContext {
        return persistenceContainer.viewContext
    }
    
    lazy var persistenceContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "BreweryCD")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    func save() {
        if self.context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetchFromPersistenceStore (complition: @escaping ([Brewery]?, Error?)->Void) {
        
        do {
            let breweriesEntities = try context.fetch(BreweryEntity.fetchRequest()) as [BreweryEntity]
            let breweries = adaptBreweries(breweries: breweriesEntities)
            complition(breweries, nil)
        } catch {
            complition(nil, error)
        }
    }
    
    func updateBreweriesCoreData(breweries: [Brewery]) {
        removeBreweriesFromPersistenceStore()
        insertBreweriesToPersistenceStore(breweries: breweries)
    }
    
    private func adaptBreweries(breweries: [BreweryEntity]) -> [Brewery] {
        var res = [Brewery]()
        
        for i in breweries {
            let brewery = Brewery(entity: i)
            res.append(brewery)
        }
        return res
    }
    
    
    private func removeBreweriesFromPersistenceStore () {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        do {
            let breweriesObj = try context.fetch(fetchRequest) as! [NSManagedObject]
            for obj in breweriesObj {
                    context.delete(obj)
            }
            save()
            print("remuving from core data was successful")
        } catch {
            print("remuving from core data was unsuccessful: \(error.localizedDescription)")
        }

    }
    
    private func insertBreweriesToPersistenceStore (breweries: [Brewery]) {
        
        for i in breweries {
            let breweryEntity = BreweryEntity(context: context)
            breweryEntity.id         = Int32(i.id ?? 0)
            breweryEntity.city       = i.city
            breweryEntity.country    = i.country
            breweryEntity.latitude   = i.latitude
            breweryEntity.longitude  = i.longitude
            breweryEntity.name       = i.name
            breweryEntity.phone      = i.phone
            breweryEntity.postalCode = i.postalCode
            breweryEntity.state      = i.state
            breweryEntity.street     = i.street
            breweryEntity.type       = i.type
            breweryEntity.website    = i.website
            save()
        }
    }
}
