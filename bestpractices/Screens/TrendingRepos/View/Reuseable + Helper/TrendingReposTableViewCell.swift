//
//  TrendingReposTableViewCell.swift
//  bestpractices
//
//  Created by SAIF ULLAH on 27/02/2021.
//

import UIKit

class TrendingReposTableViewCell: UITableViewCell {
    
    @IBOutlet weak var repoUserImg: UIImageView?
    
    @IBOutlet weak var repoUserLbl: UILabel?
    
    
    @IBOutlet weak var repoNameLbl: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //self.repoUserImg?.circleView()
        
        // Initialization code
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        guard let userimageFrame = self.repoUserImg?.frame else {
            return
            
        }
        self.repoUserImg?.skeletonCornerRadius = Float(userimageFrame.height/2)
        self.repoUserLbl?.linesCornerRadius = 5
        self.repoNameLbl?.linesCornerRadius = 5
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
