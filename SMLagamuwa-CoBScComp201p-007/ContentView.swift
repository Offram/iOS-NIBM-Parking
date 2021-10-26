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
        Text("Hello, world!")
            .padding()
            .onAppear() {
                let database = Firestore.firestore();
                let docRef = database.document("TestDocument/test");
                docRef.setData(["text": "test"]);
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
