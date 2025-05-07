//
//  AuthenticationManager.swift
//  ProjetIOS
//
//  Created by Tekup-mac-7 on 7/5/2025.
//

import Foundation
import FirebaseAuth

struct AuthDataModel {
    let uid: String
    let email: String?
    let photoURL: String?
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
        self.photoURL = user.photoURL?.absoluteString
    }
}

final class AuthenticationManager {
    static let shared = AuthenticationManager()
    private init() {}
    
    func getAuthenticatedUser() throws -> AuthDataModel {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        return AuthDataModel(user: user)
    }
    
    func createUser(email: String, password: String) async throws -> AuthDataModel{
        let authdata = try await Auth.auth().createUser(withEmail: email, password: password)
        return AuthDataModel(user: authdata.user)
    }
    
}
