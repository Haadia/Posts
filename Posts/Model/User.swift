//
//  User.swift
//  Posts
//
//  Created by Hadia Jalil on 05/04/2023.
//

import Foundation

struct User: Codable {
    let id: Int
    let name: String
    let username: String
    let email: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case username
        case email 
    }
}
