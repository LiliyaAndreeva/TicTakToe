//
//  Player.swift
//  TicTakToe
//
//  Created by Лилия Андреева on 06.04.2024.
//

import Foundation

enum Player: Codable {
    case playerOne, playerTwo
    
    var name: String{
        switch self {
            
        case .playerOne:
            return ConstantsString.playerOne
        case .playerTwo:
            return ConstantsString.playerTwo
        }
    }
}
