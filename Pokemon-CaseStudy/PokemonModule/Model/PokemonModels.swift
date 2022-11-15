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

struct ImageModel:Decodable {
    let sprites: Sprites?
}

struct Sprites: Codable {
    
    let backDefault: String?
    let backFemale: String?
    let backShiny: String?
    let backShinyFemale: String?
    let frontDefault: String?
    let frontFemale: String?
    let frontShiny: String?
    let frontShinyFemale: String?
    
    var imageUrlList : [String]? {
        return [backDefault ?? "", backFemale ?? "", backShiny ?? "", frontDefault ?? "", frontShiny ?? "", frontShinyFemale ?? ""]
    }
    enum CodingKeys: String, CodingKey, CaseIterable {
        case backDefault = "back_default"
        case backFemale = "back_female"
        case backShiny = "back_shiny"
        case backShinyFemale = "back_shiny_female"
        case frontDefault = "front_default"
        case frontFemale = "front_female"
        case frontShiny = "front_shiny"
        case frontShinyFemale = "front_shiny_female"
    }
}
