//
//  PostRowView.swift
//  Posts
//
//  Created by Hadia Jalil on 06/04/2023.
//

import SwiftUI

// Assumption: By 'Favourite posts should be persisted locally.', I assume that they should be persisted for throughout the current session. 'Post' binding is making sure that it's updated whenever toggled and hence, Favourites screen is updated accordingly. If we want to persist it even after user closes the app, we should use local storage for not just persisting Fav / (cache) all Posts but also persist User Info and not show the Login screen

struct PostRowView: View {
    @Binding var post: Post
    @StateObject var postsViewModel: PostsViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(post.title)
                    .font(.title)
                Text(post.body)
                    .font(.caption)
            }
            
            Spacer()
            
            Button(action: {
                print("Tapped")
            }) {
                Image(systemName: post.isFav ? "heart.fill" : "heart")
                    .foregroundColor(post.isFav ? .red : .gray)
            }
            .simultaneousGesture(TapGesture().onEnded {
                self.postsViewModel.toggleFavorite(for: post)
            })
        }
        .padding()
    }
}
