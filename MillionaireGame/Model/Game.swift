//
//  Game.swift
//  MillionaireGame
//
//  Created by Andrey Piskunov on 30.11.2022.
//

import Foundation

final class Game {
    
    static let shared = Game()//singleton
    
    private let resultCaretaker = ResultCaretaker()
    private let questionCaretaker = QuestionCaretaker()
    
    var session: GameSession?
    
    var random: Random = .off
    
    private(set) var results: [Result] {
        didSet { resultCaretaker.saveResult(result: self.results)
        }
    }
    
    private(set) var questions: [Question] {
        didSet { questionCaretaker.saveQuestions(question: self.questions)
        }
    }
    
    private init() {
        self.results = self.resultCaretaker.retrieveResult()
        self.questions = self.questionCaretaker.retrieveQuestion()
        testQuestions += self.questions
    }
    //MARK: - Methods
    
    func saveResult(_ result: Result) {
        self.results.append(result)
    }
    
    func saveQuestions(_ question: Question) {
        self.questions.append(question)
    }
}
