//
//  PokemonModels.swift
//  Pokemon-CaseStudy
//
//  Created by Hasan Dag on 4.11.2022.
//

import Foundation

struct ResponseModel: Codable {
    let count: Int?
    let next: String?
    let previous: String?
    let results: [Result]?
}

// MARK: - Result
struct Result: Codable {
    let name: String?
    let url: String?
    let imageUrl: String?
}

struct PokemonRequestModel {
    let limit, offset:Int?
}
