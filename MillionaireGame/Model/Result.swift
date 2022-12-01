//
//  Result.swift
//  MillionaireGame
//
//  Created by Andrey Piskunov on 01.12.2022.
//

import Foundation

struct Result: Codable {
    var counterCorrectAnswers: Int
    var counterAllQuestions: Int
    
    var persentCorrectAnswers: Float {
        (Float(self.counterCorrectAnswers)/Float(self.counterAllQuestions) * 100).rounded()
    }
}
