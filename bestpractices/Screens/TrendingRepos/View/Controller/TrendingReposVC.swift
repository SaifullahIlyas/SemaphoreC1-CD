//
//  TrendingReposVC.swift
//  bestpractices
//
//  Created by SAIF ULLAH on 27/02/2021.
//

import UIKit

class TrendingReposVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    init() {
        super.init(nibName: "TrendingReposVC", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.navitionSetup()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}





extension TrendingReposVC{
//MARK :- Helper TO setup View Controller nvigation
func navitionSetup() {
    self.title = "Trending"
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "menuright"), style: .plain, target: nil, action: nil)
}
}


