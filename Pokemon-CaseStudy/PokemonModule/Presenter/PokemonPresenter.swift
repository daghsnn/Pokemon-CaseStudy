//
//  PokemonPresenter.swift
//  Pokemon-CaseStudy
//
//  Created by Hasan Dag on 4.11.2022.
//

final class PokemonPresenter: PokemonPresenterProtocol {
    weak var view: PokemonViewProtocol?
    var interactor: PokemonInteractorProtocol?
    var router: PokemonRouterProtocol?
    var requestModel = PokemonRequestModel(limit: 50, offset: 0)
    var responseModel : ResponseModel?
    
    func fetchPokemons(_ nextPage:Bool) {
        nextPage ? interactor?.getPokemons(NetworkHelpers.configureUrlToPath(responseModel?.next ?? requestModel.requestPath)) : interactor?.getPokemons(requestModel.requestPath)
    }
    
    func showPokemonDetail(_ pokemon: Result) {
        router?.presentPokemonDetail(pokemon)
    }
}

extension PokemonPresenter: PokemonInteractorOutputProtocol {
    
    func preparePokemons(_ response: ResponseModel) {
        self.responseModel = response
        if let result = response.results {
            view?.updateView(result)
        }
    }
    
    func displayError(_ error: String) {
        view?.showError(error)
    }
}
