//
//  CommentsService.swift
//  Posts
//
//  Created by Hadia Jalil on 06/04/2023.
//

import Foundation

protocol CommentsServiceProtocol {
    func getComments(by postId: String) async -> Result<[Comment], RequestError>
}

struct CommentsService: APIService, CommentsServiceProtocol {
    func getComments(by postId: String) async -> Result<[Comment], RequestError> {
        return await sendRequest(endpoint: CommentsEndpoint(postId: postId), responseModel: [Comment].self)
    }
}

