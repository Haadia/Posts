//
//  CommentRowVie.swift
//  Posts
//
//  Created by Hadia Jalil on 06/04/2023.
//

import SwiftUI

struct CommentRowView: View {
    @Binding var comment: Comment
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(comment.name)
                .font(.headline)
            Text(comment.body)
                .font(.body)
        }
        .padding(.vertical, 8)
    }
}

