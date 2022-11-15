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
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        cv.showsVerticalScrollIndicator = false
        cv.backgroundColor = .clear
        cv.delegate = self
        cv.dataSource = self
        cv.register(PokemonCell.self, forCellWithReuseIdentifier: PokemonCell.cellId)
        return cv
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        DispatchQueue.main.async {
            LottieHud.shared.show()
        }
        presenter?.fetchPokemons(false)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavBar()
    }
    
    private func configureNavBar(){
        navigationController?.navigationBar.barTintColor = UIColor(named: "backgroundColor")
        title = "Pokemon Case Study"
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
        if let _ = self.pokemons?.count {
            self.pokemons?.append(contentsOf: result)
        } else {
            self.pokemons = result
        }
        DispatchQueue.main.async {
            LottieHud.shared.hide()
        }
        self.collectionView.reloadData()
    }
    
    func showError(_ error: String) {
        DispatchQueue.main.async {
            self.showToast(message: error, backGroundColor: .darkGray)
        }
    }
    
}
// MARK:- Collection View Delegate & Datasource

extension PokemonViewController : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemons?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonCell.cellId, for: indexPath ) as? PokemonCell, let model = pokemons?[indexPath.row], let count = pokemons?.count {
            if indexPath.row == count - 1 {
                presenter?.fetchPokemons(true)
            }
            cell.configureCell(model)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let pokemon = pokemons?[indexPath.row] {
            presenter?.showPokemonDetail(pokemon)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 3 - 8, height: UIView.HEIGHT * 0.2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0)
    }
    
}
