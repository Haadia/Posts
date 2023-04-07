//
//  Comment.swift
//  Posts
//
//  Created by Hadia Jalil on 06/04/2023.
//

import Foundation

struct Comment: Codable, Identifiable {
    let id: Int
    let postId: Int
    let name: String
    let email: String
    let body: String

    enum CodingKeys: String, CodingKey {
        case id
        case postId
        case name
        case email
        case body
    }
}
