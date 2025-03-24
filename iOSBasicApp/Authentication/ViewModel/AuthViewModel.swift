//
//  AuthViewModel.swift
//  iOSBasicApp
//
//  Created by Pramuk.u on 24/03/25.
//

import Foundation

class AuthViewModel: ObservableObject {
    @Published var user: User?
    @Published var errorMessage: String?
    
    func signUp(email: String, password: String) {
        // sign up code
    }

    func login(email: String, password: String) {
        // Login code here
    }

    func logout() {
        // Logout code here
    }
}
