//
//  SignInViewModel.swift
//  SMLagamuwa-CoBScComp201p-007
//
//  Created by user208423 on 11/8/21.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class SignInViewModel: ObservableObject {
    
    let auth = Auth.auth()
    
    @Published var signedIn = false
    @Published var user: UserModel?;
    
    var isSignedIn: Bool {
        if (auth.currentUser != nil && user == nil) {
            guard let authUserEmail = auth.currentUser?.email else {
                return false;
            }
            
            API().getUser(email: authUserEmail) { [weak self] user in
                self?.user = user
            }
        }
        return auth.currentUser != nil
    }
    
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            
            API().getUser(email: email) { user in
                
                DispatchQueue.main.async {
                    //Success
                    self?.user = user
                    self?.signedIn = true
                }
            }
        }
    }
    
    func signUp(email: String, password: String, nibmID: String, vehicleNo: String, name: String, nic: String) {
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            
            let user = UserModel(
                email: email,
                name: name,
                vehicleNo: vehicleNo,
                nibmId: nibmID,
                nic: nic
            )
            
            API().setUser(userData: user) { user in
                self?.user = user
            }
            
            DispatchQueue.main.async {
                //Success
                self?.signedIn = true
            }
        }
    }
    
    func signOut() {
        try? auth.signOut()
        
        self.signedIn = false
    }
}
