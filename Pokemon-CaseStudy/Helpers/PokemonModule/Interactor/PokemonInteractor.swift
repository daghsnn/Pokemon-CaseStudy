//
//  PokemonInteractor.swift
//  Pokemon-CaseStudy
//
//  Created by Hasan Dag on 4.11.2022.
//
import Foundation
import Alamofire

final class PokemonInteractor: PokemonInteractorProtocol {

    weak var presenter: PokemonInteractorOutputProtocol?
    
    func getPokemons(_ nextPage: String?) {
        BaseService.shared.sendRequest(nextPage) {[weak self] (data, error) in
            if let error = error {
                self?.presenter?.displayError(error.localizedDescription)
            } else if let data = data {
                do {
                    let responseModel = try JSONDecoder().decode(ResponseModel.self, from: data)
//                    self.getPokemonsWithImage(responseModel) farklı şekillerde for loop içinde API call clousere a girmedigi için hardcoded image URL çekiliyor
                    self?.presenter?.preparePokemons(responseModel)

                } catch {
                    self?.presenter?.displayError(error.localizedDescription)
                }
            }
        }
    }
    
    
    func getPokemonImage(_ group:DispatchGroup, _ path:String) -> URL? {
        var url = URL(string: String(format: "%@%@", NetworkHelpers.BASEURL!, path))!
        AF.request(url, method: .get, encoding: URLEncoding.default, headers: HTTPHeaders.default).responseJSON {[weak self] (response) in
            if let data = response.data {
                do {
                    let imageModel = try JSONDecoder().decode(ImageModel.self, from: data)
                    url = URL(string: imageModel.sprites?.frontDefault ?? "") ?? url
                    group.leave()
                } catch {
                    
                }
            }
        }
        return url
    }
    
    func getPokemonsWithImage(_ response: ResponseModel) {
        var results : ResponseModel = response
        guard let responseResult = response.results else {return}
        let urlList = responseResult.compactMap{$0.url}
        let group = DispatchGroup()

        for (index, url) in urlList.enumerated() {
            group.enter()
//            results.results?[index].imageUrl = self.getPokemonImage(group, NetworkHelpers.configureUrlToPath(url))
            group.wait()
        }
        
        self.presenter?.preparePokemons(results)
    }
    func getPokemonImageURL(_ urlList: [String]) {
        //
    }
    
}
