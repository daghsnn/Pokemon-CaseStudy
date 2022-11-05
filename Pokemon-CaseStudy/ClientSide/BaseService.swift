//
//  BaseService.swift
//  Pokemon-CaseStudy
//
//  Created by Hasan Dag on 3.11.2022.
//

import Alamofire

enum ErrorType: Error {
    case unReachable
    case some(String)
}

protocol ServiceConfiguration {
    var path : String { get }
    var session : Session {get set}
}

protocol BaseServiceProtocol {
    func sendRequest(_ nextPage:String?, _ completion: @escaping(Data?, ErrorType?) -> ())
}

final class BaseService : ServiceConfiguration {
    static let shared = BaseService()
    var path : String = String()
    var session : Session = Session()
    private init(){}

    private func hideLoading(){
        DispatchQueue.main.async {
            LottieHud.shared.hide()
        }
    }
    
    private func showLoading(){
        DispatchQueue.main.async {
            LottieHud.shared.show()
        }
    }
    
    private func configureSession() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        configuration.timeoutIntervalForResource = 30
        configuration.requestCachePolicy = .reloadRevalidatingCacheData
        configuration.urlCache = .shared
        session = Session(configuration: configuration,
                          delegate: SessionDelegate(),
                          rootQueue: DispatchQueue.main)
    }
    
}

extension BaseService : BaseServiceProtocol {
    func sendRequest(_ nextPage:String?, _ completion: @escaping(Data?, ErrorType?) -> ()) {
        if NetworkReachabilityManager()?.isReachable ?? false {
            showLoading()
        } else {
            completion(nil,.unReachable)
        }

        guard let baseUrl = NetworkHelpers.BASEURL, var url = URL(string: baseUrl + path) else{
            completion(nil,.unReachable)
            return}
        
        if let nextUrl = nextPage {
            url = URL(string: baseUrl + nextUrl) ?? url
        }
        
        configureSession()
        session.request(url, method: .get, encoding: URLEncoding.httpBody, headers: HTTPHeaders.default).validate(contentType: ["application/json"]).responseJSON { [weak self] (response) in
            if let statusCode = response.response?.statusCode {
                self?.hideLoading()
                switch statusCode {
                case 200...299:
                    if let data = response.data {
                        completion(data, nil)
                    }
                default:
                    completion(nil,ErrorType.some(response.error?.localizedDescription ??   ""))
                }
            }
        }
    }
}
