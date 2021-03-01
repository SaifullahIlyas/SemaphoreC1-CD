//
//  NetworkResponse.swift
//  bestpractices
//
//  Created by SAIF ULLAH on 28/02/2021.
//

import Foundation

protocol ParceAble {
    
}

//MARK:- Default implementation to parse json in to codeble
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
    let image : String?
    enum CodingKeys : String, CodingKey {
        case login
        case image = "avatar_url"
    }
}

