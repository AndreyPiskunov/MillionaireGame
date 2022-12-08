//
//  QuestionCaretaker.swift
//  MillionaireGame
//
//  Created by Andrey Piskunov on 05.12.2022.
//

import Foundation

final class QuestionCaretaker {
    //MARK: - Privat properties
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let key = "question"
    //MARK: - Methods
    
    func saveQuestions(question: [Question]) {
        do {
            let data = try encoder.encode(question)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    func retrieveQuestion() -> [Question] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        do {
            return try decoder.decode([Question].self, from: data)
        } catch  {
            print(error)
            return []
        }
    }
}
