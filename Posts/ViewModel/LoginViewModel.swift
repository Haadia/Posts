//
//  LoginViewModel.swift
//  Posts
//
//  Created by Hadia Jalil on 05/04/2023.
//

import Foundation

class LoginViewModel: ObservableObject {
    var userIdPlaceholderText = "User ID"
    var loginButtonTitle = "Login"
    
    @Published var userID: String = ""
    @Published var loggedIn: Bool = false
    @Published var error: String = ""
    
    private let userService: UserServiceProtocol
    
    init(userService: UserServiceProtocol = UserService()) {
        self.userService = userService
    }
    
    func login() {
        if isUserIdValid(userId: self.userID) {
            Task(priority: .background) {
                let result = await userService.getUser(by: self.userID)
                switch result {
                case .success(_):
                    DispatchQueue.main.async {
                        self.loggedIn = true
                        self.error = ""
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        self.loggedIn = false
                        self.error = error.localizedDescription
                    }
                }
            }
        }
        else {
            self.loggedIn = false
            self.error = "Invalid User Id"
        }
    }
    
    func isUserIdValid(userId: String) -> Bool {
        return (Int(userId) != nil) ? true : false
    }
}
