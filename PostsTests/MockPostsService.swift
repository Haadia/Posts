//
//  MockPostsService.swift
//  PostsTests
//
//  Created by Hadia Jalil on 07/04/2023.
//

import Foundation
@testable import Posts

final class MockPostsService: PostsServiceProtocol {
    func getPosts(by userId: String) async -> Result<[Posts.Post], Posts.RequestError> {
        return .success(MockPosts.generateMockPosts(count: 3))
    }
}


