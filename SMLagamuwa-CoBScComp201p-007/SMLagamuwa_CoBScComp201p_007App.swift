//
//  SMLagamuwa_CoBScComp201p_007App.swift
//  SMLagamuwa-CoBScComp201p-007
//
//  Created by notX on 2021-10-25.
//

import SwiftUI
import Firebase

@main
struct SMLagamuwa_CoBScComp201p_007App: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            let viewModel = SignInViewModel()
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
