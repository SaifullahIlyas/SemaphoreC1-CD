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
    
    //MARK:- Presenter
    lazy var presenter : TrendingReposPresenter = {
      return  TrendingReposPresenter.init(delegate: self)
    }()
    
    lazy var errorView : RepoLodingErrorView = {
        return RepoLodingErrorView(frame: self.view.frame)
    }()
    //MARK:- public intilizer to load view from nib
   public init() {
        super.init(nibName: "TrendingReposVC", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    //MARK:- Do All Frame Update or UI intilzation Work Here
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.navitionSetup()
        self.tableView?.separatorColor = Constants.tableSepratorColor
        
    }
    
    //MARK:- LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        presenter.getTrengingRepos()
    
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.async {
            self.view.insertSubview(self.errorView, belowSubview: self.tableView!)
        }
        self.tableView?.showAnimatedSkeleton(usingColor: Constants.tableSepratorColor!, animation: SkeletonAnimationBuilder().makeSlidingAnimation(withDirection: .leftRight), transition: .crossDissolve(0.3))
        self.tableView?.reloadData()
        
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
//MARK :- Helper TO setup View Controller
func navitionSetup() {
    self.title = "Trending"
    let barItem = UIBarButtonItem(image: UIImage(named: "menuright")?.withRenderingMode(.alwaysOriginal), style: .plain, target: nil, action: nil)
    barItem.accessibilityIdentifier = "menuright"
    self.navigationItem.rightBarButtonItem = barItem
}
}



extension TrendingReposVC : TrendingReposPresenterDelegate {
    func didGotTrendingRepos() {
        
    }
    
    func didGotError() {
        
    }
    
    
}

