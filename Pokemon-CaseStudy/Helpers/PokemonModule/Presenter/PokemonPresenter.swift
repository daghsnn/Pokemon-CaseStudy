//
//  PokemonPresenter.swift
//  Pokemon-CaseStudy
//
//  Created by Hasan Dag on 4.11.2022.
//
import Foundation

final class PokemonPresenter: PokemonPresenterProtocol {
    var view: PokemonViewProtocol?
    var interactor: PokemonInteractorProtocol?
    var router: PokemonRouterProtocol?
    var requestModel = PokemonRequestModel(limit: 50, offset: 0)
    var responseModel : ResponseModel?
    
    func fetchPokemons(_ nextPage:Bool) {
        nextPage ? interactor?.getPokemons(responseModel?.next) : interactor?.getPokemons(requestModel.requestPath)
    }
    
    func showPokemonDetail(_ pokemonUrl: String?) {
        
    }
    
    func fetchPokemonImageURL(_ urlList: [String]?) {
        if let urlList = urlList {
            interactor?.getPokemonImageURL(urlList)
        }
    }
    
    fileprivate func configureUrlModel(url: [URL]?){
        if let result = responseModel?.results, (url?.count == responseModel?.results?.count) {
            for (index, _) in result.enumerated() {
                responseModel?.results?[index].imageUrl = url?[index]
            }
        }
    }
}

extension PokemonPresenter: PokemonInteractorOutputProtocol {
    func displayPokemonsWithUrl(_ url: [URL]?) {
        configureUrlModel(url: url)
        guard let result = responseModel?.results else {
            displayError("Results Not Found..")
            return
        }
        view?.updateView(result)
    }
    
    func preparePokemons(_ response: ResponseModel) {
        self.responseModel = response
        if let urlList = response.results?.compactMap({$0.url}) {
            interactor?.getPokemonImageURL(urlList)
        }
    }
    
    func displayError(_ error: String) {
        view?.showError(error)
    }
}
