//
//  TabTitleText.swift
//  SMLagamuwa-CoBScComp201p-007
//
//  Created by user208423 on 11/7/21.
//

import SwiftUI

struct TabTitleText: View {
    private let text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        Text("\(text)")
            .font(Font.title)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
    }
}

struct TabTitleText_Previews: PreviewProvider {
    static var previews: some View {
        TabTitleText("Test")
    }
}
