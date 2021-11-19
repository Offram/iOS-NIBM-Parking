//
//  RegistrationView.swift
//  SMLagamuwa-CoBScComp201p-007
//
//  Created by user208423 on 11/7/21.
//

import SwiftUI

struct RegistrationView: View {
    
    @EnvironmentObject var viewModel: SignInViewModel
    @ObservedObject var regViewModel = RegistrationViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            
            Form {
                
                Section {
                    GreenLineTextView(
                        title: "Email",
                        text: $regViewModel.email,
                        prompt: regViewModel.emailPrompt,
                        disableAutoCorrection: true,
                        autoCapitalization: .none
                    );
                }
                
                Section(footer: Text("Password must be at least 5 characters long")) {
                    GreenLineTextView(
                        title: "Password",
                        text: $regViewModel.pass,
                        prompt: regViewModel.passwordPrompt,
                        secureField: true,
                        disableAutoCorrection: true,
                        autoCapitalization: .none
                        
                    );
                    
                    GreenLineTextView(
                        title: "Re-type Password",
                        text: $regViewModel.repass,
                        prompt: regViewModel.confirmPwPrompt,
                        secureField: true,
                        disableAutoCorrection: true,
                        autoCapitalization: .none
                    );
                }
                
                Section {
                    
                    GreenLineTextView(
                        title: "NIBM ID",
                        text: $regViewModel.nibmID,
                        prompt: regViewModel.nibmIdPrompt,
                        disableAutoCorrection: true,
                        autoCapitalization: .none
                    );
                    
                    GreenLineTextView(
                        title: "Vehicle Number",
                        text: $regViewModel.vehicleNo,
                        prompt: regViewModel.vehicleNoPrompt,
                        disableAutoCorrection: true,
                        autoCapitalization: .none
                    );
                    
                    GreenLineTextView(
                        title: "Name",
                        text: $regViewModel.name,
                        prompt: regViewModel.namePrompt,
                        disableAutoCorrection: true
                    );
                    
                    GreenLineTextView(
                        title: "NIC",
                        text: $regViewModel.nic,
                        prompt: regViewModel.nicPrompt,
                        disableAutoCorrection: true
                    );
                }
            }
            .onAppear{
                regViewModel.showPrompt = true
            }
            
            
            Spacer()
            
            Button(action: {
                
                guard !regViewModel.email.isEmpty, !regViewModel.pass.isEmpty else {
                    return
                }
                
                viewModel.signUp(
                    email: regViewModel.email,
                    password: regViewModel.pass,
                    nibmID: regViewModel.nibmID,
                    vehicleNo:  regViewModel.vehicleNo,
                    name: regViewModel.name,
                    nic: regViewModel.nic
                )
            }) {
                DefaultButtonTextView(
                    text:"Register"
                )
                    .opacity(regViewModel.isSignUpComplete ? 1 : 0.6)
                    .disabled(!regViewModel.isSignUpComplete)
            }
            .accessibility(identifier: "RegistrationView_RegisterBtn")
        }
        .navigationBarTitle("Registration", displayMode: .inline)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
