//
//  CommentsView.swift
//  Posts
//
//  Created by Hadia Jalil on 06/04/2023.
//

import SwiftUI

struct CommentsView: View {
    @Binding var post: Post
    @StateObject var commentsViewModel = CommentsViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading) {
                Text(post.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                Text(post.body)
                    .font(.body)
                    .padding(.horizontal)
            }
            .padding()
            .foregroundColor(.cyan)
            
            if commentsViewModel.comments.isEmpty || commentsViewModel.error != "" {
                Text("\(commentsViewModel.noCommentsText) \(commentsViewModel.error)")
                    .padding(.top)
                    .padding(.horizontal)
            } else {
                List($commentsViewModel.comments) { comment in
                   CommentRowView(comment: comment)
                }
            }
        }
        .navigationTitle(commentsViewModel.title)
        .onAppear {
            commentsViewModel.fetchComments(for: "\(post.id)")
        }
    }
}
