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
        TabView() {
            AvailableSlotsView().tabItem { Text("Available Slots") }.tag(1)
            Text("Tab Content 1").tabItem { /*@START_MENU_TOKEN@*/Text("Tab Label 1")/*@END_MENU_TOKEN@*/ }.tag(2)
            Text("Tab Content 2").tabItem { /*@START_MENU_TOKEN@*/Text("Tab Label 2")/*@END_MENU_TOKEN@*/ }.tag(3)
        }
        //        Text("Hello, world!")
        //            .padding()
        //            .onAppear() {
        //                let database = Firestore.firestore();
        //                let docRef = database.document("TestDocument/test");
        //                docRef.setData(["text": "test"]);
        //            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
