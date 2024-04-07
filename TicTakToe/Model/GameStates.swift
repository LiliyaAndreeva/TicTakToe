//
//  GameStates.swift
//  TicTakToe
//
//  Created by Лилия Андреева on 07.04.2024.
//

import Foundation

enum GameStates {
    case finish, draw, quit
    
    var name: String {
        switch self {
            
        case .finish:
            return ConstantsString.gameHasFinished
        case .draw:
            return ConstantsString.draw
        case .quit:
            return ConstantsString.playerLeft
        }
    }
}
