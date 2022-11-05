//
//  PokemonInteractor.swift
//  Pokemon-CaseStudy
//
//  Created by Hasan Dag on 4.11.2022.
//
import Foundation

final class PokemonInteractor: PokemonInteractorProtocol {

    weak var presenter: PokemonInteractorOutputProtocol?
    
    func getPokemons(_ nextPage: String?) {
        BaseService.shared.sendRequest(nextPage) { (data, error) in
            if let error = error {
                self.presenter?.displayError(error.localizedDescription)
            } else if let data = data {
                do {
                    let responseModel = try JSONDecoder().decode(ResponseModel.self, from: data)
                    self.presenter?.preparePokemons(responseModel)
                } catch {
                    self.presenter?.displayError(error.localizedDescription)
                }
            }
        }
    }
    
    func getPokemonImageURL(_ urlList: [String]) {
        var convertedUrls: [URL]? = [URL]()
        
        for url in urlList {
            let path = NetworkHelpers.configureUrlToPath(url)
            BaseService.shared.sendRequest(path) {[weak self] (data, error) in
                if let data = data {
                    do {
                        let imageModel = try JSONDecoder().decode(Sprites.self, from: data)
                        convertedUrls?.append(URL(string: imageModel.frontDefault ?? "")!)
                    } catch {
                        
                    }
                }
            }
        }
        presenter?.displayPokemonsWithUrl(convertedUrls)
    }
}
