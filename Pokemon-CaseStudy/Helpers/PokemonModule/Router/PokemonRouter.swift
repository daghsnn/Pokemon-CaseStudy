//
//  PokemonRouter.swift
//  Pokemon-CaseStudy
//
//  Created by Hasan Dag on 4.11.2022.
//

import UIKit

final class PokemonRouter : PokemonRouterProtocol {

    static func startPokemonExecution() -> UIViewController {
        let view: PokemonViewProtocol & UIViewController = PokemonViewController()
        let presenter: PokemonPresenterProtocol & PokemonInteractorOutputProtocol = PokemonPresenter()
        let interactor: PokemonInteractorProtocol = PokemonInteractor()
        let router: PokemonRouterProtocol = PokemonRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter

        return UINavigationController(rootViewController: view)
    }
    
    func presentDigerSayfa() {
        //
    }
    
    
}
