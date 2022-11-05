//
//  PokemonDetailModels.swift
//  Pokemon-CaseStudy
//
//  Created by Hasan Dag on 5.11.2022.
//

import Foundation

// MARK: - Welcome
struct PokemonDetailResponseModel: Codable {
    let abilities: [Ability]?
    let baseExperience: Int?
    let height: Int?
    let heldItems: [String]?
    let id: Int?
    let isDefault: Bool?
    let locationAreaEncounters: String?
    let name: String?
    let order: Int?
    let pastTypes: [String]?
    let sprites: Sprites?
    let stats: [Stat]?
    let weight: Int?

    enum CodingKeys: String, CodingKey {
        case abilities
        case baseExperience = "base_experience"
        case height
        case heldItems = "held_items"
        case id
        case isDefault = "is_default"
        case locationAreaEncounters = "location_area_encounters"
        case name, order
        case pastTypes = "past_types"
        case sprites, stats, weight
    }
}

// MARK: - Ability
struct Ability: Codable {
    let isHidden: Bool?
    let slot: Int?

    enum CodingKeys: String, CodingKey {
        case isHidden = "is_hidden"
        case slot
    }
}





// MARK: - VersionGroupDetail
struct VersionGroupDetail: Codable {
    let levelLearnedAt: Int?

    enum CodingKeys: String, CodingKey {
        case levelLearnedAt = "level_learned_at"
    }
}
// MARK: - Stat
struct Stat: Codable {
    let baseStat, effort: Int?

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort
    }
}

