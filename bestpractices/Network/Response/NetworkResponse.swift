//
//  NetworkResponse.swift
//  bestpractices
//
//  Created by SAIF ULLAH on 28/02/2021.
//

import Foundation

protocol ParceAble {
    
}

extension ParceAble {
    func parse<Resp>(data : Data) throws ->  Resp where Resp : Codable {
      
        return  try JSONDecoder().decode(Resp.self, from: data)
    }
}
class TrendingReposResponse: Codable {
    let items : [Item]?
}
class Item : Codable {
    let name : String?
    let owner : Owner?
}
class Owner : Codable{
    let login : String?
}

