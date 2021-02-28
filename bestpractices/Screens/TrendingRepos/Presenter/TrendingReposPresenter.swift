//
//  TrendingReposPresenter.swift
//  bestpractices
//
//  Created by SAIF ULLAH on 28/02/2021.
//

import Foundation

protocol TrendingReposPresenterDelegate : class {
  func  didGotTrendingRepos()
   func didGotError()
}

class TrendingReposPresenter {
    //MARK: iVars
   // private let client = (
    private weak var delegate: TrendingReposPresenterDelegate?
    
    //MARK: Initializers
    required init( delegate: TrendingReposPresenterDelegate?) {
       
        self.delegate = delegate
    }
    
}
