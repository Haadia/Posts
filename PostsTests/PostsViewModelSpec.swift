//
//  PostsViewModelSpec.swift
//  PostsTests
//
//  Created by Hadia Jalil on 07/04/2023.
//

import XCTest
@testable import Posts
import Combine

final class PostsViewModelSpec: XCTestCase {
    var postsViewModel: PostsViewModel!
    var mockPostsService: MockPostsService!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockPostsService = MockPostsService()
        postsViewModel = .init(postsService: mockPostsService)
    }
    
    func testFetchAllPostsWithValidUserIDSetsErrorToNil() {
        let expectationPosts = XCTestExpectation(description: "posts update expectation")
        let expectationError = XCTestExpectation(description: "error update expectation")

        var cancellables = Set<AnyCancellable>()
        
        postsViewModel.$posts
            .sink { value in
                if value.count == 3 {
                    expectationPosts.fulfill()
                }
            }
            .store(in: &cancellables)
        
        postsViewModel.$error
            .sink { value in
                if value == "" {
                    expectationError.fulfill()
                }
            }
            .store(in: &cancellables)

        postsViewModel.fetchAllPosts(for: "1")

        wait(for: [expectationPosts, expectationError], timeout: 5)
    }
    
    func testFavPosts() {
        
        let expectationAllPosts = XCTestExpectation(description: "posts update expectation")
        
        var cancellables = Set<AnyCancellable>()
        
        postsViewModel.$posts
            .sink { value in
                if value.count == 3 {
                    expectationAllPosts.fulfill()
                }
            }
            .store(in: &cancellables)

        postsViewModel.fetchAllPosts(for: "1")
        
        
        wait(for: [expectationAllPosts], timeout: 5)

        self.postsViewModel.toggleFavorite(for: MockPosts.generateMockPosts(count: 3).first!)

        XCTAssertEqual(postsViewModel.favPosts.count, 1)
    }
}
