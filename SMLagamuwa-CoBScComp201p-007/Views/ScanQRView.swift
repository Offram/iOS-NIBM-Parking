//
//  ScanQRView.swift
//  SMLagamuwa-CoBScComp201p-007
//
//  Created by user208423 on 11/7/21.
//

import SwiftUI

struct ScanQRView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Slot No. :")
                    .padding()
                Text("[Slot Number]")
                    .padding()
            }
            
            Spacer()
            
            Button(action: {}) {
                DefaultButtonTextView(
                    text:"Book Slot"
                )
            }
        }
        .navigationBarTitle("Scan QR Code", displayMode: .inline)
    }
}

struct ScanQRView_Previews: PreviewProvider {
    static var previews: some View {
        ScanQRView()
    }
}
