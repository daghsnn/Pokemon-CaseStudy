//
//  PokemonRouter.swift
//  Pokemon-CaseStudy
//
//  Created by Hasan Dag on 4.11.2022.
//

import UIKit

final class PokemonRouter : PokemonRouterProtocol {
    static var navController : UINavigationController!
    static func startPokemonExecution() {
        let view: PokemonViewProtocol & UIViewController = PokemonViewController()
        let presenter: PokemonPresenterProtocol & PokemonInteractorOutputProtocol = PokemonPresenter()
        let interactor: PokemonInteractorProtocol = PokemonInteractor()
        let router: PokemonRouterProtocol = PokemonRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter

        navController = UINavigationController(rootViewController: view)
    }
    
    func presentPokemonDetail(_ pokemon: Result) {
        PokemonDetailRouter.startPokemonDetailExecution(pokemon)        
    }
    
    
    
}
