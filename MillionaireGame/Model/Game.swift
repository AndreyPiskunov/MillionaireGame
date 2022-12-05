//
//  Game.swift
//  MillionaireGame
//
//  Created by Andrey Piskunov on 30.11.2022.
//

import Foundation

final class Game {
    
    static let shared = Game()//singleton
    var session: GameSession?
    
    private let resultCaretaker = ResultCaretaker()
    private let questionCaretaker = QuestionCaretaker()
    
    private(set) var results: [Result] {
        didSet { resultCaretaker.saveResult(result: self.results)
        }
    }
    
    private(set) var questions: [Question] {
        didSet { questionCaretaker.saveResult(result: self.questions)
        }
    }
    
    private init() {
        self.results = self.resultCaretaker.retrieveResult()
        self.questions = self.questionCaretaker.retrieveResult()
    }
    //MARK: - Methods
    
    func saveResult(_ result: Result) {
        self.results.append(result)
    }
    
    func saveResult(_ question: Question) {
        self.questions.append(question)
    }
}
