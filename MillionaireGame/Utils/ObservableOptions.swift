//
//  ObservableOptions.swift
//  MillionaireGame
//
//  Created by Andrey Piskunov on 05.12.2022.
//

import Foundation

public struct ObservableOptions: OptionSet, CustomStringConvertible {
     public static let initial = ObservableOptions(rawValue: 1 << 0)
     public static let old = ObservableOptions(rawValue: 1 << 1)
     public static let new = ObservableOptions(rawValue: 1 << 2)

     public var rawValue: Int

     public init(rawValue: Int) {
         self.rawValue = rawValue
     }

     public var description: String {
         switch self {
         case .initial:
             return "initial"
         case .old:
             return "old"
         case .new:
             return "new"
         default:
             return "ObservableOptions(rawValue: \(rawValue))"
         }
     }
 }
