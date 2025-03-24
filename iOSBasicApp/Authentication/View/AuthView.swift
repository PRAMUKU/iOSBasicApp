//
//  AuthView.swift
//  iOSBasicApp
//
//  Created by Pramuk.u on 24/03/25.
//


import SwiftUI

struct AuthView: View {
    @StateObject private var authViewModel = AuthViewModel()
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        VStack {
            if authViewModel.user != nil {
                Text("Welcome, \(authViewModel.user?.email ?? "")!")
                    .font(.title)
                    .padding()
                
                Button(action: {
                    authViewModel.logout()
                }) {
                    Text("Logout")
                        .frame(width: 200, height: 50)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            } else {
                Text("Login / Signup")
                    .font(.largeTitle)
                    .padding()

                TextField("Email", text: $email)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                SecureField("Password", text: $password)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Button(action: {
                    authViewModel.login(email: email, password: password)
                }) {
                    Text("Login")
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()

                Button(action: {
                    authViewModel.signUp(email: email, password: password)
                }) {
                    Text("Sign Up")
                        .frame(width: 200, height: 50)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()

                if let error = authViewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                        .padding()
                }
            }
        }
        .padding()
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
