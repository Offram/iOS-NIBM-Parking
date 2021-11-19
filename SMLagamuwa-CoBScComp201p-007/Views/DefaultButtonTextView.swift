//
//  DefaultButtonTextView.swift
//  SMLagamuwa-CoBScComp201p-007
//
//  Created by user208423 on 11/6/21.
//

import SwiftUI

struct DefaultButtonTextView: View {
    var text: String
    var foregroundColor: Color = .white
    var backgroundColor: Color = .black
    
    
    var body: some View {
        Text(text)
            .font(.headline)
            .foregroundColor(foregroundColor)
            .padding()
            .frame(width: 220, height: 60)
            .background(backgroundColor)
            .cornerRadius(35.0)
    }
}

struct DefaultButtonTextView_Previews: PreviewProvider {
    static var previews: some View {
        DefaultButtonTextView(text:"test")
    }
}
