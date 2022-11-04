//
//  PokemonPresenter.swift
//  Pokemon-CaseStudy
//
//  Created by Hasan Dag on 4.11.2022.
//

final class PokemonPresenter: PokemonPresenterProtocol {

    var view: PokemonViewProtocol?
    var interactor: PokemonInteractorProtocol?
    var router: PokemonRouterProtocol?
    var requestModel = PokemonRequestModel(limit: 50, offset: 0)
    var responseModel : ResponseModel?
    func fetchPokemons(_ nextPage:Bool) {
        interactor?.getPokemons(responseModel?.next)
    }
    
    func showPokemonDetail(_ pokemonUrl: String?) {
        
    }
    
}

extension PokemonPresenter: PokemonInteractorOutputProtocol {
    func displayPokemons(_ response: ResponseModel) {
        self.responseModel = response
        guard let result = response.results else {
            displayError("Results Not Found..")
            return
        }
        view?.updateView(result)
    }
    
    func displayError(_ error: String) {
        view?.showError(error)
    }
    

}
