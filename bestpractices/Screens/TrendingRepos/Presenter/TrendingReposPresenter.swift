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
            return "/search/repositories?q=language=+sort:stars"
        }
    }
}

protocol TrendingReposPresenterDelegate : class {
    func  didGotTrendingRepos()
    func didGotError()
}

class TrendingReposPresenter {
    //MARK: iVars
    private let client : Networking?
    private weak var delegate: TrendingReposPresenterDelegate?
    
    //MARK: Initializers
    required init( delegate: TrendingReposPresenterDelegate?) {
        client = Networking(baseURL: Constants.baseUrl, configuration: .ephemeral, cache: .none)
        self.delegate = delegate
    }
    
    func getTrengingRepos() {
        client?.get(EndPoints.getAllRepos.description, completion: { [self]result in
            switch result{
            case .success(let response):
                
                print(response.json)
                break
            case .failure( _) :
                self.delegate?.didGotError()
            }
            
        })
    }
}
