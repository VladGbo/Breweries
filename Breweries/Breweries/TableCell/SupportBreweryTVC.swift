//
//  SupportBreweryTVC.swift
//  Breweries
//
//  Created by Vladislav Horbenko on 06.02.2020.
//  Copyright © 2020 VladislavGorbenko. All rights reserved.
//

import UIKit
import MapKit

protocol SupportBreweryTVCDelegate: AnyObject {
    func didPressedOnMap(lat: String, lon: String, title: String, subTitle: String)
}

class SupportBreweryTVC: UITableViewCell {

    @IBOutlet weak var nameOfCompanyLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var mapButton: UIButton!
    weak var delegate: SupportBreweryTVCDelegate?
    private var latitude: String?
    private var longitude: String?
    
    var cellVM: BreweryCellProtocol? {
        didSet {
            guard let cellVM = cellVM as? SupportBreweryCellVM else { return }
            self.nameOfCompanyLabel.text = "\(cellVM.nameOfCompany) 2"
            self.countryLabel.text = "Country: \(cellVM.country)"
            self.stateLabel.text = "State: \(cellVM.state)"
            self.cityLabel.text = "City: \(cellVM.city)"
            self.streetLabel.text = "Street: \(cellVM.street)"
            self.latitude = cellVM.latitude
            self.longitude = cellVM.longitude
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setStyle()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func tappedOnShowMap(_ sender: UIButton) {
        if let lat = self.latitude,
            let lon = self.longitude,
            let title = self.nameOfCompanyLabel.text,
            let subtitle = self.streetLabel.text{
        delegate?.didPressedOnMap(lat: lat, lon: lon, title: title, subTitle: subtitle)
        }
    }
    
    
    private func setStyle() {
        self.layer.borderColor = CGColor(#colorLiteral(red: 0.172368288, green: 0.5335530043, blue: 0.01537404489, alpha: 1))
        self.layer.cornerRadius = 20.0
        self.layer.borderWidth = 1.0
        self.backgroundColor = #colorLiteral(red: 0.9607108235, green: 0.9608257413, blue: 0.9606716037, alpha: 1)
        
        mapButton.layer.cornerRadius = 7.0
    }
    
}
