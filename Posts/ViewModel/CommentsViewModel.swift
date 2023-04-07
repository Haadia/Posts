//
//  CommentsViewModel.swift
//  Posts
//
//  Created by Hadia Jalil on 06/04/2023.
//

import Foundation

class CommentsViewModel: ObservableObject {
    var title = "Comments"
    var noCommentsText = "No comments yet "
    
    @Published var comments = [Comment]()
    @Published var error: String = ""
    
    private var commentsService: CommentsServiceProtocol
    
    init(commentsService: CommentsServiceProtocol = CommentsService()) {
        self.commentsService = commentsService
    }
    
    func fetchComments(for post: String) {
        Task(priority: .background) {
            let result = await commentsService.getComments(by: post)
            switch result {
            case .success(let comments):
                DispatchQueue.main.async {
                    self.error = ""
                    self.comments = comments
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.error = error.localizedDescription
                }
            }
        }
    }
}
