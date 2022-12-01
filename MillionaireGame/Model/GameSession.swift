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
    
    weak var gameVCDelegate: GameVCDelegate?
    
    var counterCorrectAnswers: Int = 0
    var counterAllQuestions: Int = 0
    
}
