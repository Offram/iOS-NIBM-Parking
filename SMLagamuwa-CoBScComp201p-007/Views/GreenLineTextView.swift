//
//  GreenLineTextView.swift
//  SMLagamuwa-CoBScComp201p-007
//
//  Created by user208423 on 11/5/21.
//

import SwiftUI

struct GreenLineTextView: View {
    var title: String
    @Binding var text: String
    var keyboardType = UIKeyboardType.default
    var secureField: Bool = false
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        if(secureField) {
            SecureField(title, text: $text)
                .keyboardType(keyboardType)
                .textFieldStyle(InputGreenLineStyle())
                .background(colorScheme == .dark ? Color.black : Color.white)
        }
        else {
            TextField(title, text: $text)
                .keyboardType(keyboardType)
                .textFieldStyle(InputGreenLineStyle())
                .background(colorScheme == .dark ? Color.black : Color.white)
        }
    }
}

struct GreenLineTextView_Previews: PreviewProvider {
    @State static var text: String = ""
    
    static var previews: some View {
        GreenLineTextView(title: "Placeholder", text: $text)
    }
}
