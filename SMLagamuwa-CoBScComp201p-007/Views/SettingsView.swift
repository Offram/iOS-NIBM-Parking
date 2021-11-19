//
//  SettingsView.swift
//  SMLagamuwa-CoBScComp201p-007
//
//  Created by user208423 on 11/7/21.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var viewModel: SignInViewModel
    
    var body: some View {
        VStack {
            TabTitleText("Settings")
            Spacer()
            HStack {
                Text("NIBM ID : ")
                    .padding()
                Text(viewModel.user?.nibmId ?? "")
                    .padding()
            }
            
            HStack {
                Text("Vehicle Number : ")
                    .padding()
                Text(viewModel.user?.vehicleNo ?? "")
                    .padding()
            }
            
            HStack {
                Text("Name : ")
                    .padding()
                Text(viewModel.user?.name ?? "")
                    .padding()
            }
            
            HStack {
                Text("NIC : ")
                    .padding()
                Text(viewModel.user?.nic ?? "")
                    .padding()
            }
            
            Button(action: {
                viewModel.signOut()
            }) {
                DefaultButtonTextView(
                    text:"Logout",
                    backgroundColor: .red
                )
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
