//
//  ContentView.swift
//  SMLagamuwa-CoBScComp201p-007
//
//  Created by notX on 2021-10-25.
//

import SwiftUI
import FirebaseFirestore

struct ContentView: View {
    
    @EnvironmentObject var viewModel: SignInViewModel
    
    var body: some View {
        NavigationView {
            if viewModel.signedIn {
                MainView()
            }
            else {
                SignInView()
            }
        }
        .onAppear {
            viewModel.signedIn = viewModel.isSignedIn
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
