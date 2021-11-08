//
//  RegistrationViewModel.swift
//  SMLagamuwa-CoBScComp201p-007
//
//  Created by user208423 on 11/8/21.
//

import SwiftUI

class RegistrationViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var pass: String = ""
    @Published var repass: String = ""
    @Published var nibmID: String = ""
    @Published var vehicleNo: String = ""
    @Published var name: String = ""
    
    func passwordsMatch() -> Bool {
        pass == repass
    }
    
    func isPasswordValid() -> Bool {
        //criteria in regex. See http://regexlib.com
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^.{5,15}$")
        
        return passwordTest.evaluate(with: pass)
    }
    
    func isEmailValid() -> Bool {
        let emailTest = NSPredicate(format: "SELF MATCHES %@", #"^([a-zA-Z0-9_\\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"# )
        
        return emailTest.evaluate(with: email)
    }
    
    func isNibmIdValid() -> Bool {
        
        let nibmIdTest = NSPredicate(format: "SELF MATCHES %@", "^.{8,13}$")
        
        return nibmIdTest.evaluate(with: nibmID)
    }
    
    var isSugnUpComplete: Bool {
        if !passwordsMatch() ||
            !isPasswordValid() ||
            !isEmailValid() ||
            !isNibmIdValid() {
            return false
        }
        return true
    }
    
    
    //Validation Prompt String
    
    var confirmPwPrompt: String {
        if passwordsMatch() {
            return ""
        } else {
            return "Password fields do not match"
        }
    }
    
    var emailPrompt: String {
        if isEmailValid() {
            return ""
        } else {
            return "Enter a valid email address"
        }
    }
    
    var passwordPrompt: String {
        if isPasswordValid() {
            return ""
        } else {
            return "Must be between 5 and 15 characters"
        }
    }
    
    var nibmIdPrompt: String {
        if isNibmIdValid() {
            return ""
        } else {
            return "Enter a valid NIBM ID"
        }
    }
}
