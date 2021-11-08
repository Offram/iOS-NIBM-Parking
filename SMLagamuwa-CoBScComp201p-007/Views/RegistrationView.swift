//
//  RegistrationView.swift
//  SMLagamuwa-CoBScComp201p-007
//
//  Created by user208423 on 11/7/21.
//

import SwiftUI

struct RegistrationView: View {
    
    @State var email: String = ""
    @State var pass: String = ""
    @State var repass: String = ""
    @State var nibmID: String = ""
    @State var vehicleNo: String = ""
    @State var name: String = ""
    
    var body: some View {
        VStack {
            Spacer()
            
            GreenLineTextView(title: "Email", text: $email, keyboardType: .default);
            
            GreenLineTextView(title: "Password", text: $pass, keyboardType: .default, secureField: true);
            
            GreenLineTextView(title: "Re-type Password", text: $repass, keyboardType: .default, secureField: true);
            
            GreenLineTextView(title: "NIBM ID", text: $nibmID, keyboardType: .default);
            
            GreenLineTextView(title: "Vehicle Number", text: $vehicleNo, keyboardType: .default);
            
            GreenLineTextView(title: "Name", text: $name, keyboardType: .default);
            Spacer()
            
            Button(action: {}) {
                DefaultButtonTextView(
                    text:"Register"
                )
            }
        }
        .navigationBarTitle("Registration", displayMode: .inline)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
