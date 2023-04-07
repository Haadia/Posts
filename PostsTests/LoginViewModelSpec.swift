//
//  LoginViewModelSpec.swift
//  Posts
//
//  Created by Hadia Jalil on 06/04/2023.
//

import XCTest
@testable import Posts
import Combine

final class LoginViewModelSpec: XCTestCase {
    
    var loginViewModel: LoginViewModel!
    var mockUserService: MockUserService!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockUserService = MockUserService()
        loginViewModel = .init(userService: mockUserService)
    }
    
    func testLoginWithValidUserIDSetsLoggedInToTrue() {
        self.loginViewModel.userID = "2"
        
        let expectationLoggedIn = XCTestExpectation(description: "loggedIn update expectation")
        let expectationError = XCTestExpectation(description: "error update expectation")

        var cancellables = Set<AnyCancellable>()
        
        loginViewModel.$loggedIn
            .sink { value in
                if value == true {
                    expectationLoggedIn.fulfill()
                }
            }
            .store(in: &cancellables)
        
        loginViewModel.$error
            .sink { value in
                if value == "" {
                    expectationError.fulfill()
                }
            }
            .store(in: &cancellables)

        loginViewModel.login()
        
        wait(for: [expectationLoggedIn, expectationError], timeout: 5)
    }
    
    func testLoginWithInValidUserIDSetsLoggedInToFalse() {
        self.loginViewModel.userID = "ab"
        
        let expectationLoggedIn = XCTestExpectation(description: "loggedIn update expectation")
        let expectationError = XCTestExpectation(description: "error update expectation")

        var cancellables = Set<AnyCancellable>()
        
        loginViewModel.$loggedIn
            .sink { value in
                if value == false {
                    expectationLoggedIn.fulfill()
                }
            }
            .store(in: &cancellables)
        
        loginViewModel.$error
            .sink { value in
                if value == "Invalid User Id" {
                    expectationError.fulfill()
                }
            }
            .store(in: &cancellables)

        loginViewModel.login()
        
        wait(for: [expectationLoggedIn, expectationError], timeout: 5)
    }
}
