//
//  Question.swift
//  MillionaireGame
//
//  Created by Andrey Piskunov on 28.11.2022.
//

import Foundation

struct Question: Codable {
    let question: String
    let aunswers: [Answer]
}
