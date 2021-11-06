//
//  InputGreenLineStyle.swift
//  SMLagamuwa-CoBScComp201p-007
//
//  Created by user208423 on 11/5/21.
//

import SwiftUI

struct InputGreenLineStyle: TextFieldStyle {
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.vertical, 5.0)
            .padding(.horizontal, 40.0)
            .overlay(Rectangle()
                        .padding(.horizontal, 40.0)
                        .frame(height: 1)
                        .foregroundColor(Color.green.opacity(0.6)), alignment: .bottom)
            .padding(.bottom, 20)
        
    }
}
