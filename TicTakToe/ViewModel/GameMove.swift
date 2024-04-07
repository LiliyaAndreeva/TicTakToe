//
//  GameMove.swift
//  TicTakToe
//
//  Created by Лилия Андреева on 06.04.2024.
//

import Foundation

struct GameMove {
    let player: Player
    let boardIndex: Int
    
    var indicator: String {
        player == .playerOne ? "xmark" : "circle"
    }
    
}
