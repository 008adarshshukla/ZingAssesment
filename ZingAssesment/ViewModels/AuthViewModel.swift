//
//  AuthViewModel.swift
//  ZingAssesment
//
//  Created by Adarsh Shukla on 27/01/23.
//

import Foundation
import SwiftUI
import FirebaseAuth

class AuthViewModel: ObservableObject {
    let auth = Auth.auth()
    @Published var signedIn = false
    
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                print("Unable to SignIn")
                return
            }
            print("Signed In Successfully.")
            DispatchQueue.main.async {
                self?.signedIn = true
            }
        }
    }
    
    func signUp(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            print("Signed Up Successfully.")
            DispatchQueue.main.async {
                print("here")
                self?.signedIn = true
            }
        }
    }
}
