//
//  PokemonDetailViewController.swift
//  Pokemon-CaseStudy
//
//  Created by Hasan Dag on 5.11.2022.
//

import UIKit

final class PokemonDetailViewController: UIViewController {
    var pokemon : Result?
    private var viewPage = PokemonDetailView()
    var presenter: PokemonDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewPage.didTappedBackButton = {
            self.navigationController?.popViewController(animated: true)
        }
    }

    private func configureUI(){
        view.addSubview(viewPage)
        viewPage.snp.makeConstraints { $0.edges.equalToSuperview()}
    }

    private func configureNavBar(){
        navigationController?.isNavigationBarHidden = false
    }
}

extension PokemonDetailViewController : PokemonDetailViewProtocol {
    
    func updateView(_ result: PokemonDetailResponseModel) {
        viewPage.displayUI(result)
    }
    
    func showError(_ error: String) {
        DispatchQueue.main.async {
            self.showToast(message: error, backGroundColor: .darkGray)
        }
    }
    
    
}
