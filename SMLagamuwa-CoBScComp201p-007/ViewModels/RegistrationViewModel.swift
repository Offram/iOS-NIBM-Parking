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
    @Published var nic: String = ""
    
    @Published var showPrompt: Bool = false
    
    func passwordsMatch() -> Bool {
        return pass == repass
    }
    
    func isPasswordValid() -> Bool {
        //criteria in regex. See http://regexlib.com
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^.{5,15}$")
        
        return passwordTest.evaluate(with: pass)
    }
    
    func isEmailValid() -> Bool {
        let emailTest = NSPredicate(format: "SELF MATCHES %@", #"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$"# )
        
        return emailTest.evaluate(with: email)
    }
    
    func isNibmIdValid() -> Bool {
        
        let nibmIdTest = NSPredicate(format: "SELF MATCHES %@", "^.[a-zA-Z0-9-]{8,13}$")
        
        return nibmIdTest.evaluate(with: nibmID)
    }
    
    
    func isVehicleNoValid() -> Bool {
        
        let vehicleNoTest = NSPredicate(format: "SELF MATCHES %@", "^[A-Z]{1,3}-[0-9]{4}$")
        
        return vehicleNoTest.evaluate(with: vehicleNo)
    }
    
    
    func isNameValid() -> Bool {
        
        let nameTest = NSPredicate(format: "SELF MATCHES %@", "^([a-zA-Z0-9_]+( [a-zA-Z0-9_]+)*){5,100}$")
        
        return nameTest.evaluate(with: name)
    }
    
    
    func isNicValid() -> Bool {
        
        let nicTest = NSPredicate(format: "SELF MATCHES %@", "^(?:[0-9]{9}[VvXx]{1}|[0-9]{12})$")
        
        return nicTest.evaluate(with: nic)
    }
    
    
    var isSignUpComplete: Bool {
        if !passwordsMatch() ||
            !isPasswordValid() ||
            !isEmailValid() ||
            !isNibmIdValid() ||
            !isVehicleNoValid() ||
            !isNameValid() ||
            !isNicValid() {
            return false
        }
        return true
    }
    
    
    //Validation Prompt String
    
    var confirmPwPrompt: String {
        if passwordsMatch() {
            return ""
        } else if (showPrompt) {
            return "Password fields do not match"
        }
        else {
            return ""
        }
    }
    
    var emailPrompt: String {
        if isEmailValid() {
            return ""
        } else if (showPrompt) {
            return "Enter a valid email address"
        }
        else {
            return ""
        }
    }
    
    var passwordPrompt: String {
        if isPasswordValid() {
            return ""
        } else if (showPrompt) {
            return "Must be between 5 and 15 characters"
        }
        else {
            return ""
        }
    }
    
    var nibmIdPrompt: String {
        if isNibmIdValid() {
            return ""
        } else if (showPrompt) {
            return "Enter a valid NIBM ID"
        }
        else {
            return ""
        }
    }
    
    var vehicleNoPrompt: String {
        if isVehicleNoValid() {
            return ""
        } else if (showPrompt) {
            return "Enter a valid Vehicle Number"
        }
        else {
            return ""
        }
    }
    
    var namePrompt: String {
        if isNameValid() {
            return ""
        } else if (showPrompt) {
            return "Enter a name with characters between 5 and 100 including space"
        }
        else {
            return ""
        }
    }
    
    var nicPrompt: String {
        if isNicValid() {
            return ""
        } else if (showPrompt) {
            return "Enter a valid nic. 9 numbers ending with v/x or 12 numbers"
        }
        else {
            return ""
        }
    }
}
