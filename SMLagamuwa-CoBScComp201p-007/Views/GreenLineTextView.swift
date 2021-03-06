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
    var prompt: String?
    var keyboardType = UIKeyboardType.alphabet
    var secureField: Bool = false
    var disableAutoCorrection: Bool = false
    var autoCapitalization: UITextAutocapitalizationType = .sentences
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(alignment: .leading) {
            if(secureField) {
                SecureField(title, text: $text)
                    .keyboardType(keyboardType)
                    .disableAutocorrection(disableAutoCorrection)
                    .autocapitalization(autoCapitalization)
                    .textFieldStyle(InputGreenLineStyle())
                    .background(colorScheme == .dark ? Color.black : Color.white)
            }
            else {
                TextField(title, text: $text)
                    .keyboardType(keyboardType)
                    .disableAutocorrection(disableAutoCorrection)
                    .autocapitalization(autoCapitalization)
                    .textFieldStyle(InputGreenLineStyle())
                    .background(colorScheme == .dark ? Color.black : Color.white)
            }
            
            if !(prompt?.isEmpty ?? true) {
                Text(prompt!)
                    .padding(.horizontal, 40.0)
                    .fixedSize(horizontal: false, vertical: true)
                    .font(.caption)
                    .multilineTextAlignment(.leading)
                    .frame(alignment: .leading)
            }
        }
        .padding(.bottom, 20)
        
    }
}

struct GreenLineTextView_Previews: PreviewProvider {
    @State static var text: String = ""
    
    static var previews: some View {
        GreenLineTextView(title: "Placeholder", text: $text)
    }
}
