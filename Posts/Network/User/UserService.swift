//
//  UserService.swift
//  Posts
//
//  Created by Hadia Jalil on 05/04/2023.
//

import Foundation

protocol UserServiceProtocol {
    func getUser(by id: String) async -> Result<User, RequestError>
}

struct UserService: APIService, UserServiceProtocol {
    func getUser(by id: String) async -> Result<User, RequestError> {
        return await sendRequest(endpoint: UserEndpoint(id: id), responseModel: User.self)
    }
}
