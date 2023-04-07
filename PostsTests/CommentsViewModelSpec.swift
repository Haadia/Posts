//
//  CommentsViewModelSpec.swift
//  PostsTests
//
//  Created by Hadia Jalil on 07/04/2023.
//

import XCTest
@testable import Posts
import Combine

final class CommentsViewModelSpec: XCTestCase {
    var commentsViewModel: CommentsViewModel!
    var mockCommentsService: MockCommentsService!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockCommentsService = MockCommentsService()
        commentsViewModel = .init(commentsService: mockCommentsService)
    }
    
    func testFetchAllCommentsSetsErrorToNil() {
        let expectationComments = XCTestExpectation(description: "posts update expectation")
        let expectationError = XCTestExpectation(description: "error update expectation")
        
        var cancellables = Set<AnyCancellable>()
        
        commentsViewModel.$comments
            .sink { value in
                if value.count == 3 {
                    expectationComments.fulfill()
                }
            }
            .store(in: &cancellables)
        
        commentsViewModel.$error
            .sink { value in
                if value == "" {
                    expectationError.fulfill()
                }
            }
            .store(in: &cancellables)

        commentsViewModel.fetchComments(for: "1")

        wait(for: [expectationComments, expectationError], timeout: 5)
    }
}
