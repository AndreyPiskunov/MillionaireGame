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

struct Answer: Codable {
    let text: String
    var truth: Bool
    
    init(_ text: String,_ truth: Bool = false) {
        self.text = text
        self.truth = truth
    }
}

var testQuestions: [Question] = [
    Question(question: "Сколько нулей в миллионе?",
             aunswers: [
                Answer("6", true),
                Answer("4"),
                Answer("7"),
                Answer("5")
             ]),
    Question(question: "Какие цвета есть на логотипе бренда Coсa-Cola?",
             aunswers: [
                Answer("Чёрный и жёлтый"),
                Answer("Белый и красный", true),
                Answer("Белый и голубой"),
                Answer("Зелёный и чёрный")
             ]),
    Question(question: "Закончите поговорку: В бане веник дороже...",
             aunswers: [
                Answer("Бани"),
                Answer("Денег", true),
                Answer("Золота"),
                Answer("Жизни")
             ]),
    Question(question: "Что есть в холодильнике??",
             aunswers: [
                Answer("Компрессор", true),
                Answer("Репрессор"),
                Answer("Профессор"),
                Answer("Агрессор")
             ]),
    Question(question: "Что изображено на логотипе Mercedes-Benz?",
             aunswers: [
                Answer("Пропеллер"),
                Answer("Колесо"),
                Answer("Трехлучевая звезда", true),
                Answer("Ягуар")
             ])
]