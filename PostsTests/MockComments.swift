//
//  MockComments.swift
//  PostsTests
//
//  Created by Hadia Jalil on 07/04/2023.
//

import Foundation
@testable import Posts

class MockComments {
    static func generateMockComments(count: Int) -> [Comment] {
        var comments = [Comment]()
        
        for i in 1...count {
            let comment = Comment(id: i, postId: 1, name: "Mock User \(i)", email: "mock\(i)@gmail.com", body: "Here's a mock comment \(i)")
            comments.append(comment)
        }
        
        return comments
    }
}
