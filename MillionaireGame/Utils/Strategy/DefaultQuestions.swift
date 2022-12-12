//
//  DefaultQuestions.swift
//  MillionaireGame
//
//  Created by Andrey Piskunov on 10.12.2022.
//

import Foundation

final class DefaultQuestions: ShowQuestionStrategy {
    func showQuestions(questions: [Question]) -> [Question] {
        return questions
    }
}
