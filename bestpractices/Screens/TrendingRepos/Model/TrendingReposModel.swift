//
//  TrendingReposModel.swift
//  bestpractices
//
//  Created by SAIF ULLAH on 28/02/2021.
//

import Foundation

class TrendingReposDataSource {
    let username : String?
    let reponame : String?
    let userImage : String?
    init(username : String?, reponame : String?,userImage : String?) {
        self.username = username
        self.reponame = reponame
        self.userImage = userImage
    }
}
