//
//  PostsService.swift
//  Posts
//
//  Created by Hadia Jalil on 05/04/2023.
//

import Foundation

protocol PostsServiceProtocol {
    func getPosts(by userId: String) async -> Result<[Post], RequestError>
}

struct PostService: APIService, PostsServiceProtocol {
    func getPosts(by userId: String) async -> Result<[Post], RequestError> {
        return await sendRequest(endpoint: PostsEndpoint(userId: userId), responseModel: [Post].self)
    }
}

