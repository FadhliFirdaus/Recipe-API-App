//
//  Enum.swift
//  Recipe API App
//
//  Created by Fadhli Firdaus on 26/04/2024.
//

import Foundation


enum CustomFontName: String {
    case georgiaBoldItalic = "Georgia Bold Italic"
    case georgiaBold = "Georgia Bold"
    case georgiaItalic = "Georgia Italic"
    case georgia = "Georgia"
}

enum DataSourceType:CaseIterable {
    case APIFetched
    case hardcodedMockData
    case savedCoreData
    
    var description: String {
        switch self {
        case .APIFetched:
            return "API fetched data"
        case .hardcodedMockData:
            return "Hardcoded Mock Data"
        case .savedCoreData:
            return "Saved CoreData Data"
        }
    }
    
    static func fromString(_ string: String) -> DataSourceType? {
        return DataSourceType.allCases.first { $0.description == string }
    }
}
