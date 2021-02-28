//
//  TrendingReposVC.swift
//  bestpractices
//
//  Created by SAIF ULLAH on 27/02/2021.
//

import UIKit
import SkeletonView
import SDWebImage

class TrendingReposVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView?{
        didSet{
            self.setupRepoTableView()
            //MARK:- Setup View Hierarcy
            DispatchQueue.main.async {
                self.view.insertSubview(self.errorView, belowSubview: self.tableView!)
                self.errorView.retryTap = self.retyTapped
                self.tableView?.refreshControl = self.refreshControl
            }
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
    lazy var refreshControl : UIRefreshControl = {
        let control = UIRefreshControl()
        control.addTarget(self, action: #selector(self.actionPullToRefresh), for: .valueChanged)
       return control
    }()
    
    lazy var dataource : [TrendingReposDataSource] = {
        return []
    }()
    
    lazy var errorView : RepoLodingErrorView = {
        let view = RepoLodingErrorView(frame: self.view.frame)
        view.tag = TAGERRORVIEW
        return view
    }()
    let TAGERRORVIEW = 11111
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
       
        presenter.loadTrendingRepos()
    
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if dataource.count < 0 {
            self.applySkelton()
        }
        
    }
    
    //MARK:- Show Skelton  while loading from network
   private func applySkelton() {
        self.tableView?.showAnimatedGradientSkeleton(usingGradient: .init(baseColor: Constants.tableSepratorColor!, secondaryColor: Constants.tableSepratorColor!), animation: nil, transition: .crossDissolve(0.5))
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
    
    @objc private func actionPullToRefresh() {
        presenter.getTrengingRepos()
    }
    private func retyTapped() {
        self.tableView?.showAnimatedGradientSkeleton(usingGradient: .init(baseColor: Constants.tableSepratorColor!, secondaryColor: Constants.tableSepratorColor!), animation: nil, transition: .crossDissolve(0.5))
        self.view.bringSubviewToFront(self.tableView!)
        presenter.getTrengingRepos()
    }

}




extension TrendingReposVC : UITableViewDelegate,SkeletonTableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataource.count != 0 ? dataource.count : 12
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataource.count != 0 ? dataource.count : 12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reposcellClass) as? TrendingReposTableViewCell else {return UITableViewCell()}
        
        //MARK:- Avoid Error while loading shimmer i.e method invoked during shimmer effect
        if !dataource.isEmpty{
        cell.repoNameLbl?.text = dataource[indexPath.item].reponame
        cell.repoUserLbl?.text = dataource[indexPath.item].username
            if let url = URL(string: dataource[indexPath.item].userImage ?? "") {
                cell.repoUserImg?.sd_imageTransition = .fade
                cell.repoUserImg?.sd_imageIndicator = SDWebImageActivityIndicator.gray
                cell.repoUserImg?.sd_setImage(with: url, completed: nil)
            }
        }
        return cell
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
    func didGotTrendingRepos(data: [TrendingReposDataSource]) {
        dataource = data
        //MARK:- Hide Shimmer and reload data in tableview after
        DispatchQueue.main.async {
            self.refreshControl.endRefreshing()
            self.tableView?.stopSkeletonAnimation()
            self.tableView?.hideSkeleton(reloadDataAfter: true, transition: .crossDissolve(0.05))
           
        }
    }
    func didGotError() {
        
        DispatchQueue.main.async {
            self.refreshControl.endRefreshing()
            self.view.bringSubviewToFront(self.errorView)
        }
       
    }
    
    
}

