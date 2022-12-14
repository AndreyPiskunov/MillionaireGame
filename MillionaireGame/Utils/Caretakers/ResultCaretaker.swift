//
//  RecordCaretaker.swift
//  MillionaireGame
//
//  Created by Andrey Piskunov on 02.12.2022.
//

import Foundation

final class ResultCaretaker {
    //MARK: - Privat properties
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let key = "result"
    //MARK: - Methods
    
    func saveResult(result: [Result]) {
        do {
            let data = try encoder.encode(result)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func retrieveResult() -> [Result] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        do {
            return try decoder.decode([Result].self, from: data)
        } catch  {
            print(error.localizedDescription)
            return []
        }
    }
}
