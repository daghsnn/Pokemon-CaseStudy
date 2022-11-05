//
//  PokemonDetailRouter.swift
//  Pokemon-CaseStudy
//
//  Created by Hasan Dag on 5.11.2022.
//

import UIKit

final class PokemonDetailRouter : PokemonDetailRouterProtocol {
    static func startPokemonDetailExecution(_ pokemon : Result) {
        let view: PokemonDetailViewProtocol & UIViewController = PokemonDetailViewController()
        let presenter: PokemonDetailPresenterProtocol & PokemonDetailInteractorOutputProtocol = PokemonDetailPresenter()
        let interactor: PokemonDetailInteractorProtocol = PokemonDetailInteractor()
        let router: PokemonDetailRouterProtocol = PokemonDetailRouter()
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        view.presenter?.fetchPokemonDetails(pokemon.url)
    }

}
