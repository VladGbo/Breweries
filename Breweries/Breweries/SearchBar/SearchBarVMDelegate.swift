//
//  SearchBarVMDelegate.swift
//  Breweries
//
//  Created by Vladislav Horbenko on 10.02.2020.
//  Copyright © 2020 VladislavGorbenko. All rights reserved.
//

import Foundation
import UIKit

protocol SearchBarVMDelegate: AnyObject {
    var brewerySearchController  : UISearchController { get }
    var breweryBreweriesTableView: UITableView { get }
}
