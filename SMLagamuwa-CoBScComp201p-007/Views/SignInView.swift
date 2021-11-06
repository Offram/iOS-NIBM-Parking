//
//  SignInView.swift
//  SMLagamuwa-CoBScComp201p-007
//
//  Created by user208423 on 11/5/21.
//

import SwiftUI

struct SignInView: View {
    
    @State var name: String = ""
    @State var pass: String = ""
    private let externalURL = "https://www.apple.com"
    @Environment(\.openURL) var openURL
    
    var body: some View {
        VStack {
            Text("Sign In");
            Spacer();
            GreenLineTextView(title: "Email", text: $name, keyboardType: .default);
            GreenLineTextView(title: "Password", text: $pass, keyboardType: .default, secureField: true);
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                DefaultButtonTextView(text:"Login", backgroundColor: .green)
            }
            Spacer()
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                DefaultButtonTextView(text:"Register", backgroundColor: .blue)
            }
            Spacer()
            Button("Terms and Conditions") {
                openURL(URL(string: externalURL)!)
            }
        }
        .padding()
        
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
