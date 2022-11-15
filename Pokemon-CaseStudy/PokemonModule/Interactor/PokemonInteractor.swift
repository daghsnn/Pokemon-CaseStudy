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
        BaseService.shared.sendRequest(nextPage) {[weak self] (data, error) in
            if let error = error {
                self?.presenter?.displayError(error.localizedDescription)
            } else if let data = data {
                do {
                    let responseModel = try JSONDecoder().decode(ResponseModel.self, from: data)
                    self?.getPokemonsWithImage(responseModel)
                } catch {
                    self?.presenter?.displayError(error.localizedDescription)
                }
            }
        }
    }
    

    
    func getPokemonsWithImage(_ response: ResponseModel) {
        var results : ResponseModel = response
        guard let responseResult = response.results else {return}
        let urlList = responseResult.compactMap{$0.url}
        var ulrStringArray : [String] = [String]()
        let group = DispatchGroup()
        DispatchQueue.global(qos: .background).async {
            for (index, url) in urlList.enumerated() {
                group.enter()
                BaseService.shared.sendRequest(NetworkHelpers.configureUrlToPath(url)) { (data, error) in
                    if let data = data {
                        do {
                            defer{group.leave()}
                            let model = try JSONDecoder().decode(PokemonDetailResponseModel.self, from: data)
                            results.results?[index].imageUrl = URL(string: model.sprites?.frontDefault ?? model.sprites?.backDefault ?? "")
                        } catch {
                        }
                    }
                }
                
            }
            group.notify(queue: DispatchQueue.main) {
                self.presenter?.preparePokemons(results)
            }
        }
        
        
    }

}
