//
//  MainView.swift
//  SMLagamuwa-CoBScComp201p-007
//
//  Created by user208423 on 11/8/21.
//

import SwiftUI

struct MainView: View {
    var body: some View {
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

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
