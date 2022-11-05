//
//  PokemonProtocols.swift
//  Pokemon-CaseStudy
//
//  Created by Hasan Dag on 3.11.2022.
//

import UIKit

protocol PokemonViewProtocol: AnyObject {
    var presenter: PokemonPresenterProtocol?{get set}
    func updateView(_ result: [Result])
    func showError(_ error: String)
}

protocol PokemonPresenterProtocol : AnyObject {
    var view: PokemonViewProtocol? {get set}
    var interactor: PokemonInteractorProtocol? {get set}
    var router: PokemonRouterProtocol?{get set}
    func fetchPokemons(_ nextPage:Bool)
    func fetchPokemonImageURL(_ urlList: [String]?)
    func showPokemonDetail(_ pokemonUrl: String?)
    
}

protocol PokemonInteractorProtocol : AnyObject {
    var presenter: PokemonInteractorOutputProtocol?{get set}
    func getPokemons(_ nextPage: String?)
    func getPokemonImageURL(_ urlList: [String])
}

protocol PokemonInteractorOutputProtocol : AnyObject {
    func displayPokemonsWithUrl(_ url: [URL]?)
    func preparePokemons(_ response: ResponseModel)
    func displayError(_ error:String)
}

protocol PokemonRouterProtocol {
    static func startPokemonExecution() -> UIViewController
    func presentDigerSayfa(/* buraya model ve view protocol
         from view: PostListViewProtocol, forPost post: PostModel*/)
}
