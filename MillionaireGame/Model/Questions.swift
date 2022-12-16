//
//  Questions.swift
//  MillionaireGame
//
//  Created by Andrey Piskunov on 02.12.2022.
//

import Foundation

var testQuestions: [Question] = [
    Question(question: "Сколько нулей в миллионе?",
             answers: [
                Answer("6", true),
                Answer("4"),
                Answer("7"),
                Answer("5")
             ]
            ),
    Question(question: "Какие цвета есть на логотипе бренда Coсa-Cola?",
             answers: [
                Answer("Чёрный и жёлтый"),
                Answer("Белый и красный", true),
                Answer("Белый и голубой"),
                Answer("Зелёный и чёрный")
             ]
            ),
    Question(question: "Закончите поговорку: В бане веник дороже...",
             answers: [
                Answer("Бани"),
                Answer("Денег", true),
                Answer("Золота"),
                Answer("Жизни")
             ]
            ),
    Question(question: "Что есть в холодильнике??",
             answers: [
                Answer("Компрессор", true),
                Answer("Репрессор"),
                Answer("Профессор"),
                Answer("Агрессор")
             ]
            ),
    Question(question: "Что изображено на логотипе Mercedes-Benz?",
             answers: [
                Answer("Пропеллер"),
                Answer("Колесо"),
                Answer("Трехлучевая звезда", true),
                Answer("Ягуар")
             ]
            ),
]

