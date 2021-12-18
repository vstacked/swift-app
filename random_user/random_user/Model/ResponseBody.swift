//
//  ResponseBody.swift
//  random_user
//
//  Created by vstacked on 18/12/21.
//

import Foundation

struct ResponseBody: Decodable{
    var page: Int
    var perPage: Int
    var total: Int
    var totalPages: Int
    var data: [UserData]
    
    enum CodingKeys: String, CodingKey{
        case perPage = "per_page"
        case totalPages = "total_pages"
        case page
        case total
        case data
    }

}

struct UserData: Decodable{
    var id: Int
    var email: String
    var firstName: String
    var lastName: String
    var avatar: String
    
    enum CodingKeys: String, CodingKey{
        case firstName = "first_name"
        case lastName = "last_name"
        case id
        case email
        case avatar
    }
}
