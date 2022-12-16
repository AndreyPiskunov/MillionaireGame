//
//  GameSession.swift
//  MillionaireGame
//
//  Created by Andrey Piskunov on 30.11.2022.
//

import Foundation

protocol GameVCDelegate: AnyObject {
    func scorePoints(_ points: Int)
    func setAllQuestionsCount(_ count: Int)
}

class GameSession {
    
    var showQuestions: ShowQuestionStrategy
    
    init(showQuestions: ShowQuestionStrategy) {
        self.showQuestions = showQuestions
    }
    
    weak var gameVCDelegate: GameVCDelegate?
    
    var numberQuestion = Observable<Int>(0)
    var points = 0
    var allQuestionsCount = 0
    var percentProgress: Float {
        (Float(self.numberQuestion.value) / Float(self.allQuestionsCount) * 100).rounded()
    }
}
