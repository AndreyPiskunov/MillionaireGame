//
//  Answer.swift
//  MillionaireGame
//
//  Created by Andrey Piskunov on 02.12.2022.
//

import Foundation

struct Answer: Codable {
    let text: String
    var truth: Bool
    
    init(_ text: String,_ truth: Bool = false) {
        self.text = text
        self.truth = truth
    }
}
