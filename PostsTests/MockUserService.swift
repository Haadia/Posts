//
//  MockUserService.swift
//  Posts
//
//  Created by Hadia Jalil on 06/04/2023.
//

import Foundation
@testable import Posts

final class MockUserService: UserServiceProtocol {
    func getUser(by id: String) async -> Result<User, RequestError> {
        return .success(MockUser.generateMockUser())
    }
}
