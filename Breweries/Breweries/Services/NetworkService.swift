//
//  NetworkService.swift
//  Breweries
//
//  Created by Vladislav Horbenko on 05.02.2020.
//  Copyright © 2020 VladislavGorbenko. All rights reserved.
//

import Foundation


class NetworkService {
    
    private let api = Bundle.main.object(forInfoDictionaryKey: "API_BASE_URL") as! String
    typealias NetworkResult = ([Brewery]?, Error?)-> Void
    
    static let shared = NetworkService()
    
    private init () {}
    
    func requestFetchListOfBreweries(complition: @escaping NetworkResult) {
        let link = "\(api)breweries"
        guard let url = URL(string:link) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            
            if let data = data {
                do {
                    let jsonDecoder = JSONDecoder()
                    let breweries = try jsonDecoder.decode([Brewery].self, from: data)
                    complition(breweries, nil)
                } catch {
                    complition(nil, error)
                }
            }
            
            if let error = error {
                complition(nil, error)
            }
            
        }.resume()
    }
    
    func requestSearchBreweries(breweries: String, complition: @escaping NetworkResult) {
        //
        let link = "\(api)breweries?by_name=\(breweries)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        guard let url = URL(string:link!) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            
            if let data = data {
                do {
                    let jsonDecoder = JSONDecoder()
                    let breweries = try jsonDecoder.decode([Brewery].self, from: data)
                    complition(breweries, nil)
                } catch {
                    complition(nil, error)
                }
            }
            
            if let error = error {
                complition(nil, error)
            }
        }.resume()
    }
    
}
