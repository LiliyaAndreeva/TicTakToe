//
//  BoardCircleView.swift
//  TicTakToe
//
//  Created by Лилия Андреева on 06.04.2024.
//

import SwiftUI

struct BoardCircleView: View {
    var geometry: GeometryProxy
    
    
    @State var sizeDivider: CGFloat = 3
    @State var padding: CGFloat = Space.small
    
    var body: some View{
        Circle()
            .fill(.white)
            .frame(width: geometry.size.width / sizeDivider - padding, height: geometry.size.width / sizeDivider - padding)
    }
}


