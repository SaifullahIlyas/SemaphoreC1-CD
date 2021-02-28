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
    func parse<T>(data : Data, Resp : T.Type) throws ->  T where T : Decodable  {
      
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

