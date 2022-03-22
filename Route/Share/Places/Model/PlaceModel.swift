//
//  PlaceModel.swift
//  Route
//
//  Created by Katherine Movile on 3/13/22.
//

import Foundation
import Foundation

struct GooglePlace: Codable {
    let predictions: [Prediction]
    let status: String
}

struct Prediction: Codable {
    let predictionDescription: String
    let matchedSubstrings: [MatchedSubstring]
    let placeID, reference: String
    let structuredFormatting: StructuredFormatting
    let terms: [Term]
    let types: [String]

    enum CodingKeys: String, CodingKey {
        case predictionDescription = "description"
        case matchedSubstrings = "matched_substrings"
        case placeID = "place_id"
        case reference
        case structuredFormatting = "structured_formatting"
        case terms, types
    }
}

struct MatchedSubstring: Codable {
    let length, offset: Int
}

struct StructuredFormatting: Codable {
    let mainText: String
    let mainTextMatchedSubstrings: [MatchedSubstring]
    let secondaryText: String

    enum CodingKeys: String, CodingKey {
        case mainText = "main_text"
        case mainTextMatchedSubstrings = "main_text_matched_substrings"
        case secondaryText = "secondary_text"
    }
}

struct Term: Codable {
    let offset: Int
    let value: String
}
