//
//  NetworkController.swift
//  DogAPI
//
//  Created by Esther on 1/25/23.
//

import Foundation
struct NetworkController {
    // Divide API Service from endpoints and data decoding to make the code more reusable (if we end up needing multiple data models and to avoid rewriting the same function multiple times)
    func perform(_ request: URLRequest, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error {
                completion(.failure(.requestError(error)))
            }
            if let response = response as? HTTPURLResponse {
                print("\(response.statusCode)")
            }
            guard let data = data else {
                completion(.failure(.couldNotUnwrap))
                return
            }
            completion(.success(data))
            
        /// Resume a suspended state of a function. Newly initialized tasks begin in suspended state.
        }.resume()
    }
}
