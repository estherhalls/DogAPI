//
//  DogServiceable.swift
//  DogAPI
//
//  Created by Esther on 1/25/23.
//

import Foundation

// Use DogService struct and servicable protocol to employ SOLID data management, avoid memory leaks when accessing data in view model class
protocol DogServiceable {
    func fetch(from endpoint: DogEndpoints, completion: @escaping (Result <Dog, NetworkError>) -> Void)
}

struct DogService: DogServiceable {
    
    private let service = NetworkController()
    
    func fetch(from endpoint: DogEndpoints, completion: @escaping (Result <Dog, NetworkError>) -> Void) {
        guard let url = endpoint.fullURL else {
            completion(.failure(.invalidURL))
            return
        }
        let request = URLRequest(url: url)
        
        service.perform(request) { result in
            switch result {
            case .success(let data):
                do {
                    let dog = try data.decode(type: Dog.self)
                    completion(.success(dog))
                } catch {
                    completion(.failure(.unableToDecode))
                }
            case .failure(let error):
                completion(.failure(.requestError(error)))
            }
        }
    }
}
