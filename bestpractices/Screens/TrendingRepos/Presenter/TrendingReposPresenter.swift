//
//  TrendingReposPresenter.swift
//  bestpractices
//
//  Created by SAIF ULLAH on 28/02/2021.
//

import Foundation

enum EndPoints : CustomStringConvertible {
    case getAllRepos
    var description: String {
        switch self {
        case .getAllRepos:
            return "search/repositories?q=language=+sort:stars"
        }
    }
}


protocol MapableToViewModel {
    func map(model : TrendingReposResponse) -> [TrendingReposDataSource]
}
protocol TrendingReposPresenterDelegate : class {
    func  didGotTrendingRepos(data : [TrendingReposDataSource])
    func didGotError()
}

class TrendingReposPresenter : ParceAble,MapableToViewModel{
    //MARK: iVars
    public let client : Networking?
    public weak var delegate: TrendingReposPresenterDelegate?
    
    //MARK: Initializers
    required init( delegate: TrendingReposPresenterDelegate?) {
        client = Networking(baseURL: Constants.baseUrl, configuration: .ephemeral, cache: .none)
        self.delegate = delegate
    }
    
    func getTrengingRepos() {
        client?.get(EndPoints.getAllRepos.description, completion: { [weak self] result in
            switch result{
            case .success(let response):
                
                guard let response =  try? self?.parse(data: response.data, Resp: TrendingReposResponse.self) else {
                    self?.delegate?.didGotError()
                    return
                }
                self?.saveObjectInDefault(data: response)
                let data = self?.map(model: response)
                
                
                self?.delegate?.didGotTrendingRepos(data: data ?? [])
                
            case .failure( _) :
                self?.delegate?.didGotError()
            }
            
        })
    }
    
    /*MARK:- load from user default(can be from core data) to  resdeuce api consumption.
     pull to refresh feature is for  desperate users to see trending Repo.Almost all applications reduce api cost from backend by checking periodic update and feed their users through realtime mechanism. let say  I have a credit  card  that  applies some exchange rate and i have api to fectch exchange rate from server that applies some cost. I will call and save response to a period at backend and feed my front end users from server. What for cost if number of client or Front plateform increased in feature i.e multiply By X number
     */
    
    public func loadTrendingRepos() {
        if let savedObj = loadTrendingReposFromDefault(){
            self.delegate?.didGotTrendingRepos(data: self.map(model: savedObj) )
        }
        else {
            self.getTrengingRepos()
        }
    }
    
    private func saveObjectInDefault(data : TrendingReposResponse){
        
        guard let jsonData = try? JSONEncoder().encode(data) else {return}
        UserDefaults.standard.setValue(jsonData, forKey: Constants.cacheName)
        
        
        
        
    }
    private func loadTrendingReposFromDefault()-> TrendingReposResponse?{
        if let saveTrendingRepos = UserDefaults.standard.object(forKey: Constants.cacheName) as? Data {
            let response =   try? JSONDecoder().decode(TrendingReposResponse.self, from: saveTrendingRepos)
            return response
        }
        return nil
    }
}


extension MapableToViewModel {
    //MARK:- Tranform NetWork Response to appropriate DataSource
    func map(model : TrendingReposResponse) -> [TrendingReposDataSource] {
        return model.items?.compactMap({TrendingReposDataSource(username: $0.name, reponame: $0.owner?.login, userImage: $0.owner?.image)}) ?? []
    }
}
