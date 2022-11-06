//
//  PokemonInteractor.swift
//  Pokemon-CaseStudy
//
//  Created by Hasan Dag on 4.11.2022.
//
import Foundation

final class PokemonInteractor: PokemonInteractorProtocol {
    
    weak var presenter: PokemonInteractorOutputProtocol?
    
    func getPokemons(_ nextPage: String?) {
        BaseService.shared.sendRequest(nextPage) {[weak self] (data, error) in
            if let error = error {
                self?.presenter?.displayError(error.localizedDescription)
            } else if let data = data {
                do {
                    let responseModel = try JSONDecoder().decode(ResponseModel.self, from: data)
                    self?.presenter?.preparePokemons(responseModel)
                } catch {
                    self?.presenter?.displayError(error.localizedDescription)
                }
            }
        }
    }
}
