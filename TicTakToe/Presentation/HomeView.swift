//
//  ContentView.swift
//  TicTakToe
//
//  Created by Лилия Андреева on 06.04.2024.
//

import SwiftUI



struct HomeView: View {
    
    // MARK: Properties Internal
   @State private var isPresented = false
    
    // MARK: ViewBuilders
    @ViewBuilder
    private func titleView() -> some View {
        VStack(spacing: Space.large){
            Image(systemName: ConstantsString.imageName)
                .renderingMode(.original)
                .resizable()
                .frame(width: Space.sizeImage, height: Space.sizeImage)
                .foregroundStyle(.indigo)
            Text(ConstantsString.tictaktoe)
                .font(.largeTitle)
                .fontWeight(.semibold)
        }
        .padding(.top, Space.large)
    }
    
    
    @ViewBuilder
    private func buttonView() -> some View {
        Button {
            isPresented.toggle()
        } label: {
            Text(ConstantsString.playNow)
        }
        .buttonStyle(AppButtonStyle(color: .green))
        .padding(.horizontal, Space.small)
        .padding(.top, Space.big)
    }
    
    @ViewBuilder
    private func main() -> some View {
        VStack{
            titleView()
            Spacer()
            buttonView()
                .padding(.bottom, Space.big )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(CustomColors.primary)
    }
    
    // MARK: Body
    
    var body: some View {
        main()
            .fullScreenCover(isPresented: $isPresented, content: {
                GameView(viewModel: GameViewModel())
            })
    }
}

// MARK: - Preview
#Preview {
    HomeView()
}
