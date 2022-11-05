//
//  PokemonDetailInteractor.swift
//  Pokemon-CaseStudy
//
//  Created by Hasan Dag on 5.11.2022.
//

import Foundation

final class PokemonDetailInteractor: PokemonDetailInteractorProtocol {
    weak var presenter: PokemonDetailInteractorOutputProtocol?
    
    func getPokemons(_ pokemonUrl: String) {
        BaseService.shared.sendRequest(NetworkHelpers.configureUrlToPath(pokemonUrl)) {[weak self] (data, error) in
            if let error = error {
                self?.presenter?.displayError(error.localizedDescription)
            } else if let data = data {
                do {
                    let responseModel = try JSONDecoder().decode(PokemonDetailResponseModel.self, from: data)
                    self?.presenter?.preparePokemons(responseModel)
                } catch {
                    self?.presenter?.displayError(error.localizedDescription)
                }
            }
        }
    }

}
