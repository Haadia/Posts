//
//  PostsView.swift
//  Posts
//
//  Created by Hadia Jalil on 02/04/2023.
//

import SwiftUI

struct PostsMainView: View {
    @StateObject var postsViewModel: PostsViewModel
    @EnvironmentObject var loginViewModel: LoginViewModel
    
    var body: some View {
        TabView {
            PostsListView(posts: $postsViewModel.posts, postsViewModel: postsViewModel)
                .tabItem {
                    Image(systemName: "newspaper")
                    Text(postsViewModel.allPostsText)
                }
            
            PostsListView(posts: $postsViewModel.favPosts, postsViewModel: postsViewModel)
                .tabItem {
                    Image(systemName: "heart")
                    Text(postsViewModel.favPostsText)
                        .font(.headline)
                }
        }
        .navigationTitle(postsViewModel.title)
        .navigationBarBackButtonHidden(true)
        .onAppear {
            postsViewModel.fetchAllPosts(for: loginViewModel.userID)
        }
        // Pull to refresh functionality can be implemented here for refreshing and fetching again.
    }
}


