//
//  NSAttributedStringExtension.swift
//  Breweries
//
//  Created by Vladislav Horbenko on 17.02.2020.
//  Copyright © 2020 VladislavGorbenko. All rights reserved.
//

import Foundation


extension NSAttributedString {
    
    static func makeHiperLink(for path: String, in string: String, as substring: String) -> NSAttributedString {
        let nsString = NSString(string: string)
        let subStringRange = nsString.range(of: substring)
        let attributedString = NSMutableAttributedString(string: string)
        attributedString.addAttribute(.link, value: path, range: subStringRange)
        return attributedString
    }
    
}
