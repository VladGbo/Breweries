//
//  MainBreweryTVC.swift
//  Breweries
//
//  Created by Vladislav Horbenko on 06.02.2020.
//  Copyright © 2020 VladislavGorbenko. All rights reserved.
//

import UIKit

protocol MainBreweryTVCDelegate: AnyObject {
    func didPresedWebsite(link: String)
}

class MainBreweryTVC: UITableViewCell {

    @IBOutlet weak var nameOfCompanyLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    weak var delegate: MainBreweryTVCDelegate?
    
    var cellVM: BreweryCellProtocol? {
        didSet {
            guard let cellVM = cellVM as? MainBeweryCellVM else { return }
            self.nameOfCompanyLabel.text = cellVM.nameOfCompany
            self.phoneNumberLabel.text = "Phone: \(cellVM.phoneNumber)"
            self.websiteLabel.text = "Website: \(cellVM.website)"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setStyle()
        setGestureForWebsite()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    private func setStyle() {
        self.layer.borderColor = CGColor(#colorLiteral(red: 0.172368288, green: 0.5335530043, blue: 0.01537404489, alpha: 1))
        self.layer.cornerRadius = 20.0
        self.layer.borderWidth = 1.0
        self.backgroundColor = #colorLiteral(red: 0.9607108235, green: 0.9608257413, blue: 0.9606716037, alpha: 1)
    }
    private func setAttribete(text: String) ->  NSMutableAttributedString{
        let muteText = NSMutableAttributedString(string: text)
        muteText.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.black, range: NSRange(location:2,length:4))
        
        return muteText
    }
    private func setGestureForWebsite(){
        let tap = UIGestureRecognizer(target: self, action: #selector(tappedOnWebsite))
        websiteLabel.addGestureRecognizer(tap)
        websiteLabel.isUserInteractionEnabled = true
    }
    
    @objc private func tappedOnWebsite() {
        guard let link = websiteLabel.text else { return }
        delegate?.didPresedWebsite(link: link)
    }
}
