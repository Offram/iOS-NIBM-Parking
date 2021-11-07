//
//  ContentView.swift
//  SMLagamuwa-CoBScComp201p-007
//
//  Created by notX on 2021-10-25.
//

import SwiftUI
import FirebaseFirestore

struct ContentView: View {
    var body: some View {
        NavigationView {
            TabView() {
                AvailableSlotsView()
                    .tabItem { Text("Available Slots") }.tag(1)
                BookingPageView()
                    .tabItem { Text("Booking") }.tag(2)
                SettingsView()
                    .tabItem { Text("Settings") }.tag(3)
            }
            .navigationBarTitle("Main Page", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
