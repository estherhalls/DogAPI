//
//  DogServiceable.swift
//  DogAPI
//
//  Created by Esther on 1/25/23.
//

import SwiftUI

// Use DogService struct and servicable protocol to employ SOLID data management - dependency inversion for unit test
protocol DogServiceable {
    func fetchBreedsList(from endpoint: DogEndpoints, completion: @escaping (Result <[String], NetworkError>) -> Void)
    func fetchRandomImage(from endpoint: DogEndpoints, completion: @escaping (Result <URL, NetworkError>) -> Void)
}

struct DogService: DogServiceable {
    
    private let service = NetworkController()
    
    func fetchBreedsList(from endpoint: DogEndpoints, completion: @escaping (Result <[String], NetworkError>) -> Void) {
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
                    /// Temporary array to hold results of for-in loop
                    var breeds: [String] = []
                    /// Dog breed name strings gathered from api and added to new array
                    for breed in dog.dogBreeds {
                        breeds.append(breed.key)
                    }
                    /// Complete with array of dog breed names to pass to the drop down list
                    completion(.success(breeds))
                } catch {
                    completion(.failure(.unableToDecode))
                }
            case .failure(let error):
                completion(.failure(.requestError(error)))
            }
        }
    }
    
    func fetchRandomImage(from endpoint: DogEndpoints, completion: @escaping (Result <URL, NetworkError>) -> Void) {
        guard let url = endpoint.fullURL else {
            completion(.failure(.invalidURL))
            return
        }
        let request = URLRequest(url: url)
        
        service.perform(request) { result in
            switch result {
            case .success(let data):
                do {
                    let breedImage = try data.decode(type: BreedImages.self)
                    guard let imageURL = URL(string: breedImage.image) else {
                        return
                    }
                    completion(.success(imageURL))
                } catch {
                    completion(.failure(.unableToDecode))
                }
            case .failure(let error):
                completion(.failure(.requestError(error)))
            }
        }
    }
}
