//
//  Helpers.swift
//  bestpractices
//
//  Created by SAIF ULLAH on 27/02/2021.
//

import UIKit


extension UIView {
    func circleView() {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.frame.height/2
    }
    
    
}

