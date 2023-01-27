//
//  SignIn.swift
//  ZingAssesment
//
//  Created by Adarsh Shukla on 27/01/23.
//

import SwiftUI
import FirebaseAuth

struct SignIn: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack(spacing: 20) {
                    TextField("Email Address", text: $email)
                        .padding()
                        .background {
                            Color(.secondarySystemBackground)
                        }
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                    
                    SecureField("Email Address", text: $password)
                        .padding()
                        .background {
                            Color(.secondarySystemBackground)
                        }
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                }
                .padding()
                
                
                Button {
                    authViewModel.signIn(email: email, password: password)
                } label: {
                    Text("Sign In")
                        .foregroundColor(.white)
                        .frame(width: 150, height: 50)
                        .background {
                            Color.blue
                        }
                        .cornerRadius(10)
                }
                .disabled(email.isEmpty && password.isEmpty)
            }
            .navigationTitle("Sign In")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        SignUp()
                    } label: {
                        Text("Sign Up")
                            .font(.title2)
                            .fontWeight(.bold)
                    }

                }
        }
        }
    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SignIn()
                .environmentObject(AuthViewModel())
        }
    }
}
