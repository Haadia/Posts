//
//  PostsListView.swift
//  Posts
//
//  Created by Hadia Jalil on 06/04/2023.
//

import SwiftUI

struct PostsListView: View {
    @Binding var posts: [Post]
    @StateObject var postsViewModel: PostsViewModel
    
    var body: some View {
        VStack {
            if posts.isEmpty {
                Text(postsViewModel.noPostsText)
                    .foregroundColor(.gray)
            }
            else {
                List($posts) { post in
                    NavigationLink(destination: CommentsView(post: post)) {
                        PostRowView(post: post, postsViewModel: postsViewModel)
                    }
                }
            }
        }
    }
}
