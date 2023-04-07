//
//  UserEndpoint.swift
//  Posts
//
//  Created by Hadia Jalil on 05/04/2023.
//

import Foundation

struct UserEndpoint: Endpoint {
    var path: String
    var method: RequestMethod = .get
    var header: [String : String]? = nil
    var body: [String : String]? = nil
    var queryItems: [URLQueryItem]? = nil
    
    init(id: String) {
        self.path = "/users/\(id)"
    }    
}
