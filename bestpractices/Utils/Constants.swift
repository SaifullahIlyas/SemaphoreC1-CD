//
//  Constants.swift
//  bestpractices
//
//  Created by SAIF ULLAH on 27/02/2021.
//

import UIKit
class Constants {
    
    //MARK:- Colors
    static let appPrimaryColor = UIColor(named: "primaryColor")
    static let backGroundColor = UIColor(named: "backgroundColor")
    static let tableSepratorColor = UIColor(named: "tablesepratorColor")
    static let appidentifier = Bundle.main.infoDictionary?["CFBundleIdentifier"] as? String ?? ""
    //MARK:- Utils
    static let baseUrl = "https://api.github.com/"
    static let cacheName = "CACHEREPOS"
}
