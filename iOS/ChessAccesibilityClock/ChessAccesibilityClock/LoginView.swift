//
//  LoginView.swift
//  ChessAccesibilityClock
//
//  Created by Anthony Sale on 07/05/2026.
//

import SwiftUI

struct LoginView: View {
    @Binding var isLoggedIn: Bool
    @State private var username = ""
    @State private var password = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Chess Accessibility Clock")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            Text("Login")
                .font(.title2)
                .foregroundColor(.white)
                .padding(.bottom)
            
            VStack(spacing: 15) {
                TextField("Username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .foregroundColor(.primary)
                    .padding(.horizontal)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .foregroundColor(.primary)
                    .padding(.horizontal)
            }
            
            Button(action: {
                // Simple dummy login - accepts any non-empty username
                if !username.isEmpty {
                    isLoggedIn = true
                }
            }) {
                Text("Login")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .padding()
        .ignoresSafeArea()
        .background(Color.green)
    }
}

#Preview {
    LoginView(isLoggedIn: .constant(false))
}
