//
//  CommentsEndpoint.swift
//  Posts
//
//  Created by Hadia Jalil on 06/04/2023.
//

import Foundation

struct CommentsEndpoint: Endpoint {
    var path: String
    var method: RequestMethod = .get
    var header: [String : String]? = nil
    var body: [String : String]? = nil
    var queryItems: [URLQueryItem]? = nil

    init(postId: String) {
        self.path = "/comments"
        self.queryItems = [URLQueryItem(name: "postId", value: "\(postId)")]
    }}
