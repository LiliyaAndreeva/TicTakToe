//
//  BoardingIndicatorView.swift
//  TicTakToe
//
//  Created by Лилия Андреева on 06.04.2024.
//

import SwiftUI

struct BoardingIndicatorView: View {
    
    var imageName: String
    @State private var scale = 1.5
    
    var body: some View{
        Image(systemName: imageName)
            .resizable()
            .frame(width: Space.mBig, height: Space.mBig)
            .scaledToFit()
            .foregroundColor(.indigo)
            .scaleEffect(scale)
            .animation(.spring(), value: scale)
            .shadow(radius: 5)
            .onChange(of: imageName) { newValue in
                self.scale = 2.5
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
                    self.scale = 1.5
                }
            }
    }
}

#Preview {
    BoardingIndicatorView(imageName: "applelogo")
}
