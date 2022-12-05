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
    
    func saveResult(result: [Question]) {
        do {
            let data = try encoder.encode(result)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func retrieveResult() -> [Question] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        do {
            return try decoder.decode([Question].self, from: data)
        } catch  {
            print(error.localizedDescription)
            return []
        }
    }
}
