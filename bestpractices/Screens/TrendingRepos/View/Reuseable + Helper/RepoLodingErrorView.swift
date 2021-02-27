//
//  RepoLodingErrorView.swift
//  bestpractices
//
//  Created by SAIF ULLAH on 27/02/2021.
//

import UIKit

class RepoLodingErrorView: UIView {
    
    @IBOutlet private var container: RepoLodingErrorView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadView()
    }
   func loadView () {
    Bundle.main.loadNibNamed("RepoLodingErrorView", owner: self, options: nil)
    container.loadXib(self)
        
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
