//
//  GameView.swift
//  TicTakToe
//
//  Created by Лилия Андреева on 06.04.2024.
//

import SwiftUI

struct GameView: View {
    
    
    // MARK: Properties Internal
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: GameViewModel
    
    // MARK: ViewBuilders
    @ViewBuilder
    private func closeButton() -> some View {
        HStack{
            Spacer()
            Button {
                dismiss()
            } label: {
                Text(ConstantsString.exit)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.red)
            }
            .frame(width: 80, height: 40)
            .background(RoundedRectangle(cornerRadius: 10)
                .fill(.white)
            )
        }
        .padding(.horizontal, Space.small)
        .padding(.bottom, Space.small)
    }
    
    @ViewBuilder
    private func scoreView() -> some View {
        HStack{
            Text("\(viewModel.playerOneName) : \(viewModel.playerOneScore)")
            Spacer()
            Text("\(viewModel.playerTwoName) : \(viewModel.playerTwoScore)")
        }
        .foregroundColor(.indigo)
        .font(.title2)
        .fontWeight(.semibold)
    }
    
    @ViewBuilder
    private func gameStatus() -> some View {
        VStack{
            Text(viewModel.gameNotification)
                .font(.title2)
        }
        .foregroundStyle(.indigo)
    }
    
    @ViewBuilder
    private func gameBoard(geometry: GeometryProxy) -> some View {
        VStack{
            LazyVGrid(columns: viewModel.columns,spacing: Space.xsmall) {
                ForEach(0..<9) { index in
                    
                    ZStack{
                        BoardCircleView(geometry: geometry)
                        BoardingIndicatorView(imageName: viewModel.moves[index]?.indicator ?? "")
                    }
                    .onTapGesture {
                        viewModel.proccesMove(for: index)
                    }
                }
            }
        }
        .padding(.bottom, Space.tiny)
       
    }
    
    @ViewBuilder
    private func main() -> some View {
        
        GeometryReader { geo in
            VStack {
                closeButton()
                scoreView()
                Spacer()
                gameStatus()
                Spacer()
                gameBoard(geometry: geo)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.horizontal, Space.small)
            .background(CustomColors.primary)
        }
    }
    
    // MARK: Body
    var body: some View {
        main()
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: viewModel.alertItem!.title, message: viewModel.alertItem!.message, dismissButton: .default(viewModel.alertItem!.buttonTitle) {
                    viewModel.resetGame()
                }
                )
            }
    }
}


// MARK: - Preview
#Preview {
    GameView(viewModel: GameViewModel())
}
