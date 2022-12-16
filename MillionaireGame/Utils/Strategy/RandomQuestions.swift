//
//  RandomQuestions.swift
//  MillionaireGame
//
//  Created by Andrey Piskunov on 10.12.2022.
//

import Foundation

final class RandomQuestions: ShowQuestionStrategy {
    func showQuestions(questions: [Question]) -> [Question] {
        return questions.shuffled()
    }
}
