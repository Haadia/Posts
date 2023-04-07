//
//  MockUser.swift
//  PostsTests
//
//  Created by Hadia Jalil on 07/04/2023.
//

import Foundation
@testable import Posts

class MockUser {
    static func generateMockUser() -> User {
        User(id: 1, name: "Hadia", username: "hadiaj", email: "hadia@gmail.com")
    }
}
