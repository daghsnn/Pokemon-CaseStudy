//
//  PokemonViewController.swift
//  Pokemon-CaseStudy
//
//  Created by Hasan Dag on 3.11.2022.
//

import UIKit

final class PokemonViewController:UIViewController {
    
    var presenter: PokemonPresenterProtocol?
    var pokemons:[Result]?
    private lazy var collectionView : UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        cv.showsVerticalScrollIndicator = false
        cv.backgroundColor = .clear
        cv.delegate = self
        cv.dataSource = self
//        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: HomeCell.cellId)
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        presenter?.fetchPokemons(false)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavBar()
    }
    
    private func configureNavBar(){
        navigationController?.title = "Pokemon Case Study"
        navigationController?.modalTransitionStyle = .flipHorizontal
        navigationController?.isNavigationBarHidden = false
    }
    
    private func configureUI(){
        view.backgroundColor = UIColor(named: "backgroundColor")
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(UIView.WIDTH * 0.05)
        }
    }
}
// MARK:- Display Logic
extension PokemonViewController: PokemonViewProtocol {
    func updateView(_ result: [Result]) {
        DispatchQueue.main.async {
            if let _ = self.pokemons?.count {
                self.pokemons?.append(contentsOf: result)
            } else {
                self.pokemons = result
            }
            self.collectionView.reloadData()
        }
    }
    
    func showError(_ error: String) {
        DispatchQueue.main.async {
            self.showToast(message: error, backGroundColor: .darkGray)
        }
    }
    
}
// MARK:- Collection View Delegate & Datasource

extension PokemonViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        UICollectionViewCell()
        // pagination 
    }
    
    
}
