//
//  SettingsView.swift
//  SMLagamuwa-CoBScComp201p-007
//
//  Created by user208423 on 11/7/21.
//

import SwiftUI

struct SettingsView: View {
    
    @State var isSignInActive = false
    
    var body: some View {
        VStack {
            TabTitleText("Settings")
            Spacer()
            HStack {
                Text("NIBM ID : ")
                    .padding()
                Text("[NIBM ID]")
                    .padding()
            }
            
            HStack {
                Text("Vehicle Number : ")
                    .padding()
                Text("[Vehicle No.]")
                    .padding()
            }
            
            HStack {
                Text("Name : ")
                    .padding()
                Text("[Name]")
                    .padding()
            }
            
            HStack {
                Text("NIC : ")
                    .padding()
                Text("[NIC]")
                    .padding()
            }
            
            NavigationLink(
                destination: SignInView(),
                isActive: $isSignInActive
            ){
                Button(action: {
                    isSignInActive = true
                }) {
                    DefaultButtonTextView(
                        text:"Logout",
                        backgroundColor: .red
                    )
                }
            }
            
            Spacer()
            
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}