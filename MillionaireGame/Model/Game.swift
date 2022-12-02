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
    
    private(set) var results: [Result] {
        didSet { resultCareTaker.saveResult(result: self.results)
        }
    }
    
    private let resultCareTaker = ResultCaretaker()
    private init() {
        self.results = self.resultCareTaker.retrieveResult()
    }
    
    func saveResult(_ record: Result) {
        self.results.append(record)
    }
}
