//
//  NetworkServiceFactory.swift
//  TastyRecipes
//
//  Created by Bartosz Wojtkowiak on 14/06/2022.
//

import Foundation

class NetworkServiceFactory {
    static func create() -> NetworkService {
        let environment = ProcessInfo.processInfo.environment["ENV"]
        
        if let environment = environment {
            if environment == "TEST" {
                return MockWebservice()
            } else {
                return Webservice()
            }
        } else {
            return Webservice()
        }
    }
}
