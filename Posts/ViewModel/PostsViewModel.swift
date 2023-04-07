//
//  PostsViewModel.swift
//  Posts
//
//  Created by Hadia Jalil on 06/04/2023.
//

import Foundation

class PostsViewModel: ObservableObject {
    var title = "Posts"
    var noPostsText = "No posts to show"
    var allPostsText = "ALL"
    var favPostsText = "FAV"

    @Published var posts: [Post] = [Post]() {
        didSet {
            self.favPosts = posts.filter { $0.isFav }
        }
    }
    
    @Published var favPosts: [Post] = [Post]()
    @Published var error: String = ""
    
    private var postsService: PostsServiceProtocol
    
    init(postsService: PostsServiceProtocol = PostService()) {
        self.posts = [Post]()
        self.postsService = postsService
    }
    
    func fetchAllPosts(for user: String) {
        // If not already fetched
        // Pull to refresh functionality can be implemented for refreshing and fetching again.
        if self.posts.isEmpty {
            Task(priority: .background) {
                let result = await postsService.getPosts(by: user)
                switch result {
                case .success(let posts):
                    DispatchQueue.main.async {
                        self.error = ""
                        self.posts = posts
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        self.posts = []
                        self.error = error.localizedDescription
                    }
                }
            }
        }
    }
    
    func toggleFavorite(for post: Post) {
        if let index = posts.firstIndex(where: { $0.id == post.id }) {
            posts[index].isFav.toggle()
        }
    }
}
