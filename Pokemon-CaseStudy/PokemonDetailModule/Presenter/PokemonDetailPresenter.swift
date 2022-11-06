//
//  PokemonDetailPresenter.swift
//  Pokemon-CaseStudy
//
//  Created by Hasan Dag on 5.11.2022.
//

import Foundation

final class PokemonDetailPresenter: PokemonDetailPresenterProtocol {

    weak var view: PokemonDetailViewProtocol?
    var interactor: PokemonDetailInteractorProtocol?
    var router: PokemonDetailRouterProtocol?
    
    func fetchPokemonDetails(_ pokemonUrl: String?) {
        if let url = pokemonUrl {
            interactor?.getPokemons(url)
        }
    }
    
}

extension PokemonDetailPresenter : PokemonDetailInteractorOutputProtocol {
    func preparePokemons(_ response: PokemonDetailResponseModel) {
        view?.updateView(response)
    }
    
    func displayError(_ error: String) {
        view?.showError(error)
    }
    
    
}
