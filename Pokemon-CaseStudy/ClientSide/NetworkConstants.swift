//
//  NetworkConstants.swift
//  Pokemon-CaseStudy
//
//  Created by Hasan Dag on 4.11.2022.
//

import Foundation

struct NetworkHelpers {
    static let BASEURL = Bundle.main.object(forInfoDictionaryKey: "BaseURL") as? String
    
    static func configureUrlToPath(_ url:String) -> String {
        let baseUrlcount = NetworkHelpers.BASEURL?.count ?? 0
        return String(url.dropFirst(baseUrlcount))
    }
}
