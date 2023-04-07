//
//  MockCommentsService.swift
//  PostsTests
//
//  Created by Hadia Jalil on 07/04/2023.
//

import Foundation
@testable import Posts

final class MockCommentsService: CommentsServiceProtocol {
    func getComments(by postId: String) async -> Result<[Posts.Comment], Posts.RequestError> {
        return .success(MockComments.generateMockComments(count: 3))
    }
}
