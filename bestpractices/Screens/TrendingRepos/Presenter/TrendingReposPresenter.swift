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
               let data = self?.map(model: response)
                self?.delegate?.didGotTrendingRepos(data: data ?? [])
                
            case .failure( _) :
                self?.delegate?.didGotError()
            }
            
        })
    }
}


extension MapableToViewModel {
    //MARK:- Tranform NetWork Response to appropriate DataSource
    func map(model : TrendingReposResponse) -> [TrendingReposDataSource] {
        return model.items?.compactMap({TrendingReposDataSource(username: $0.name, reponame: $0.owner?.login, userImage: $0.owner?.image ?? "")}) ?? []
    }
}
