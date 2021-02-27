//
//  TrendingReposVC.swift
//  bestpractices
//
//  Created by SAIF ULLAH on 27/02/2021.
//

import UIKit
import SkeletonView

class TrendingReposVC: UIViewController {
    

    @IBOutlet weak var tableView: UITableView?{
        didSet{
            self.setupRepoTableView()
        }
    }
    
    
    //MARK:- iVAR
    lazy var reposcellClass : String = {
        return String((NSStringFromClass(TrendingReposTableViewCell.classForCoder()).split(separator: ".")[1]))
    }()
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
    
    //MARk:- LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView?.showSkeleton()
        self.tableView?.reloadData()
        let eeview = RepoLodingErrorView(frame: self.tableView!.frame)
        
       self.tableView?.addSubview(eeview)
        self.tableView?.bringSubviewToFront(eeview)
       // UIView.transition(from: tableView!, to: eeview, duration: 0.2, options: .transitionCrossDissolve, completion: nil)
        
    }
    
    
    
    func setupRepoTableView() {
        
        
        self.tableView?.register(UINib(nibName: reposcellClass, bundle: nil),
                                 forCellReuseIdentifier: reposcellClass)
        self.tableView?.isSkeletonable = true
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        
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




extension TrendingReposVC : UITableViewDelegate,SkeletonTableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reposcellClass)
        return cell!
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
    return reposcellClass
    }
    
}



extension TrendingReposVC{
//MARK :- Helper TO setup View Controller nvigation
func navitionSetup() {
    self.title = "Trending"
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "menuright"), style: .plain, target: nil, action: nil)
}
}


