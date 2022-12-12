//
//  CreateQuestionStrategy.swift
//  MillionaireGame
//
//  Created by Andrey Piskunov on 10.12.2022.
//

import Foundation

protocol ShowQuestionStrategy {
    func showQuestions(questions: [Question]) -> [Question]
}
