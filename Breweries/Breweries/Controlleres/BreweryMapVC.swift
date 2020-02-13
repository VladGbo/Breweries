//
//  BreweryMapVC.swift
//  Breweries
//
//  Created by Vladislav Horbenko on 05.02.2020.
//  Copyright © 2020 VladislavGorbenko. All rights reserved.
//

import UIKit
import MapKit

class BreweryMapVC: UIViewController {
    
    private var breweryMapView: MKMapView?
    
    var model: BreweryMapVM? {
        didSet {
            self.title = "Map"
            setMap()
            setMapSetting()
        }
    }

    
    func setMapSetting() {
        
        guard let model = model else { return }
        let latitude = Double(model.latitude) ?? 0
        let longitude = Double (model.longitude) ?? 0
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        annotation.title = model.title
        annotation.subtitle = model.subTitle
        
        let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        
        if let breweryMapView = breweryMapView {
            breweryMapView.addAnnotation(annotation)
            breweryMapView.region = region
        }
    }
    
    private func setMap() {
        let point = CGPoint(x: 0, y: 0)
        let size = CGSize(width: self.view.frame.width, height: self.view.frame.height)
        self.breweryMapView = MKMapView(frame: CGRect(origin: point, size: size))
        if let breweryMapView = self.breweryMapView {
            self.view.addSubview(breweryMapView)
        }
    }
    
}
