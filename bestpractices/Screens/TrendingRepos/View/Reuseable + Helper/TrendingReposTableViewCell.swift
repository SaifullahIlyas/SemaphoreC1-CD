//
//  TrendingReposTableViewCell.swift
//  bestpractices
//
//  Created by SAIF ULLAH on 27/02/2021.
//

import UIKit

class TrendingReposTableViewCell: UITableViewCell {
    
    @IBOutlet weak var repoUserImg: UIImageView?
    
    @IBOutlet weak var repoUser: UILabel?
    
    
    @IBOutlet weak var repoName: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.repoUserImg?.circleView()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
