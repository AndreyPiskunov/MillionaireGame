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
    
    var results: [Result] = []
    
    private init() {}
    
    func saveResult(_ record: Result) {
        self.results.append(record)
    }
    
}
