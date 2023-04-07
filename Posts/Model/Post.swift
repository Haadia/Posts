//
//  Post.swift
//  Posts
//
//  Created by Hadia Jalil on 05/04/2023.
//

import Foundation

struct Post: Codable, Identifiable {
    let id: Int
    let userId: Int
    let title: String
    let body: String
    var isFav: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case id
        case userId
        case title
        case body
    }
}
