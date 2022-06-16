//
//  MockWebservice.swift
//  TastyRecipesUnitTests
//
//  Created by Bartosz Wojtkowiak on 14/06/2022.
//

import Foundation

class MockWebservice: NetworkService {
    func downloadData<T: Decodable>(of type: T.Type, from url: URL, completion: @escaping (Result<T, DataError>) -> Void) {
        guard let url = Bundle(for: MockWebservice.self).url(forResource: "meals-success-response", withExtension: "json"),
              let data = try? Data(contentsOf: url)
        else {
            return completion(.failure(.invalidData))
        }
        
        guard let meals = try? JSONDecoder().decode(T.self, from: data)
        else {
            return completion(.failure(.decodingError))
        }
        
        completion(.success(meals))
    }
}
