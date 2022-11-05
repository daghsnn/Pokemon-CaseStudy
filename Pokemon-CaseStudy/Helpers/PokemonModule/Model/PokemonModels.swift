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
    var results: [Result]?
}

// MARK: - Result
struct Result: Codable {
    let name: String?
    let url: String?
    var imageUrl: URL?
}

struct PokemonRequestModel {
    let limit, offset:Int?
    var requestPath : String {
        guard let limit = limit, let offset = offset else {return ""}
        return "pokemon?limit=\(String(limit))&offset=\(String(offset))"
    }
}

struct Sprites:Decodable {
    let frontDefault: String?
}
