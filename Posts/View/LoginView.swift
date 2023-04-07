//
//  LoginView.swift
//  Posts
//
//  Created by Hadia Jalil on 02/04/2023.
//

import SwiftUI

struct LoginView: View {
    @StateObject var loginViewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink(destination: PostsMainView(postsViewModel: PostsViewModel()), isActive: $loginViewModel.loggedIn) { }
                
                if loginViewModel.error != "" {
                    Text(loginViewModel.error)
                }
                
                TextField(loginViewModel.userIdPlaceholderText, text: $loginViewModel.userID)
                    .padding()
                    .border(Color.gray, width: 1)
                    .padding(.horizontal, 20)
                    .padding(.top, 50)
                
                Button(action: {
                    loginViewModel.login()
                }) {
                    Text(loginViewModel.loginButtonTitle)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.top, 50)
            }
        }
        .environmentObject(loginViewModel)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
