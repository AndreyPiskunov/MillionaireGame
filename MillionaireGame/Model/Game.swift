//
//  Game.swift
//  MillionaireGame
//
//  Created by Andrey Piskunov on 30.11.2022.
//

import Foundation

final class Game {
    static let shared = Game()
    
    var session: GameSession?
    
    private init() {}
}
