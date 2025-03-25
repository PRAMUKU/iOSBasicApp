//
//  AuthViewModel.swift
//  iOSBasicApp
//
//  Created by Pramuk.u on 24/03/25.
//

import Foundation
import FirebaseAuth

class AuthViewModel: ObservableObject {
    @Published var user: User?
    @Published var toastMessage: String?
    
    init() {
        user = Auth.auth().currentUser
    }
    
    func signUp(email: String, password: String) {
        // sign up code
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
            guard let self = self else { return }
            guard error == nil else {
                self.toastMessage = error?.localizedDescription
                return
            }
            
            let user = authResult?.user
            self.user = user
            
            self.toastMessage = "User created successfully!"
        }
    }

    func login(email: String, password: String) {
        // Login code here
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let strongSelf = self else { return }
            guard error == nil else {
                strongSelf.toastMessage = error?.localizedDescription
                return
            }
            strongSelf.user = authResult?.user
            strongSelf.toastMessage = "Successfully logged in! - \(String(describing: authResult?.user.email))"
        }
    }

    func logout() {
        // Logout code here
        do {
            try Auth.auth().signOut()
            user = nil
            self.toastMessage = "User logged out successfully!"
        } catch {
            toastMessage = "Error logging out: \(error.localizedDescription)"
        }
    }
}
