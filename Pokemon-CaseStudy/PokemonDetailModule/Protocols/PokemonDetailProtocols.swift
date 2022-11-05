//
//  PokemonDetailProtocols.swift
//  Pokemon-CaseStudy
//
//  Created by Hasan Dag on 5.11.2022.
//

import UIKit

protocol PokemonDetailViewProtocol: AnyObject {
    var presenter: PokemonDetailPresenterProtocol?{get set}
    func updateView(_ result: PokemonDetailResponseModel)
    func showError(_ error: String)
}

protocol PokemonDetailPresenterProtocol : AnyObject {
    var view: PokemonDetailViewProtocol? {get set}
    var interactor: PokemonDetailInteractorProtocol? {get set}
    var router: PokemonDetailRouterProtocol?{get set}
    func fetchPokemonDetails(_ pokemonUrl:String?)
}

protocol PokemonDetailInteractorProtocol : AnyObject {
    var presenter: PokemonDetailInteractorOutputProtocol?{get set}
    func getPokemons(_ pokemonUrl:String)
}

protocol PokemonDetailInteractorOutputProtocol : AnyObject {
    func preparePokemons(_ response: PokemonDetailResponseModel)
    func displayError(_ error:String)
}

protocol PokemonDetailRouterProtocol {
    static func startPokemonDetailExecution(_ pokemon : Result)
}
