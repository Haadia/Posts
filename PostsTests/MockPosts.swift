//
//  MockPosts.swift
//  PostsTests
//
//  Created by Hadia Jalil on 07/04/2023.
//

import Foundation
@testable import Posts

class MockPosts {
    static func generateMockPosts(count: Int) -> [Post] {
        var posts = [Post]()
        
        for i in 1...count {
            let post = Post(id: i, userId: 1, title: "Post \(i)", body: "Here's Post No. \(i)")
            posts.append(post)
        }
        
        return posts
    }
}
