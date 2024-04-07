//
//  ButtonStyle.swift
//  TicTakToe
//
//  Created by Лилия Андреева on 06.04.2024.
//

import SwiftUI

struct AppButtonStyle: ButtonStyle {
    
    let color: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(height: 40)
            .frame().frame(maxWidth: .infinity)
            .font(.title2)
            .fontWeight(.semibold)
            .padding()
            .background(color)
            .foregroundStyle(.white)
            .clipShape(Capsule())
            .opacity(configuration.isPressed ? 0.5 : 1)
            .shadow(radius: 8)
    }
}

extension ButtonStyle {
    static func appButton(color: Color) -> AppButtonStyle {
        AppButtonStyle(color: color)
    }
}
