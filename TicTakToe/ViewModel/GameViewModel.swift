//
//  gameViewModel.swift
//  TicTakToe
//
//  Created by Лилия Андреева on 06.04.2024.
//

import SwiftUI
import Combine

final class GameViewModel: ObservableObject {
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    private let winCombination: Set<Set<Int>> = [[0,1,2], [3,4,5], [6,7,8],
                                                 [0,3,6], [1, 4, 7], [2, 5, 8],
                                                 [0,4,8], [2,4,6]
    ]
    
    @Published private(set) var moves: [GameMove?] = Array(repeating: nil, count: 9)
    @Published  var playerOneScore = 0
    @Published  var playerTwoScore = 0
    @Published  var playerOneName = ""
    @Published  var playerTwoName = ""
    @Published  var gameNotification = ""
    @Published private var activrPlayer: Player = .playerOne
    @Published var alertItem: AlertItem?
    
    
    @Published private var players: [Player] = [.playerOne, .playerTwo]
    @Published var showAlert =  false
    
    
    init(){
        gameNotification = "It's \(activrPlayer.name)'s move"
        observeData()
    }
    
    private func observeData() {
        $players
            .map{$0.first?.name ?? ""}.assign(to: &$playerOneName)
        $players
            .map{$0.last?.name ?? ""}.assign(to: &$playerTwoName)
    }
    
    func proccesMove(for possition: Int) {
        if isSquereOccupies(in: moves, for: possition) {return}
        
        moves[possition] = GameMove(player: activrPlayer, boardIndex: possition)
        
        if checkForWin(in: moves){
            showAlert(for: .finish)
            increaseScore()
            return
        }

        if checkForDrow(in: moves) {
            showAlert(for: .draw)
            return
        }
        activrPlayer = players.first(where: {$0 != activrPlayer})!
        gameNotification = "It's \(activrPlayer.name)'s move"
    }
    
    private func isSquereOccupies(in moves: [GameMove?], for index: Int) -> Bool {
        moves.contains(where: { $0?.boardIndex == index })
    }
    
    private func checkForDrow(in moves: [GameMove?]) -> Bool{
        moves.compactMap { $0}.count == 9
        //remove the nil objects
    }
    
    private func checkForWin(in moves: [GameMove?]) -> Bool {
        let playerMoves = moves.compactMap { $0 }.filter{ $0.player == activrPlayer }
        let playerPosition = Set(playerMoves.map{$0.boardIndex})
        
        
        for winner in winCombination where winner.isSubset(of: playerPosition) { return true }
        return false
    }
    
    private func increaseScore() {
        if activrPlayer == .playerOne {
            playerOneScore += 1
        }else {
            playerTwoScore += 1
        }
    }
    
    private func showAlert(for gameState: GameStates) {
        gameNotification = gameState.name
        
        switch gameState {
            
        case .finish, .draw:
            let title = (gameState == .finish) ? "\(activrPlayer.name) has won" : gameState.name
            alertItem = AlertItem(title: title, message: ConstantsString.tryRematch)
        case .quit:
            let title = gameState.name
            alertItem = AlertItem(title: title, message: "", buttonTitle: "OK")
        }
        
        showAlert = true
    }
    
    func resetGame() {
        activrPlayer = .playerOne
        moves = Array(repeating: nil, count: 9)
        gameNotification = "It's \(activrPlayer.name)'s move"
    }
}


