//
//  DogServiceable.swift
//  DogAPI
//
//  Created by Esther on 1/25/23.
//

import UIKit

// Use DogService struct and servicable protocol to employ SOLID data management - dependency inversion for unit test
protocol DogServiceable {
    func fetchBreedsList(from endpoint: DogEndpoints, completion: @escaping (Result <[Dog], NetworkError>) -> Void)
    
    func fetchImageURL(from endpoint: DogEndpoints, completion: @escaping (Result <URL, NetworkError>) -> Void)
    
    func fetchImage(using url: URL, completion: @escaping (Result <UIImage,NetworkError>) -> Void)
}

struct DogService: DogServiceable {
    
    private let service = NetworkController()
    
    func fetchBreedsList(from endpoint: DogEndpoints, completion: @escaping (Result <[Dog], NetworkError>) -> Void) {
        guard let url = endpoint.fullURL else {
            completion(.failure(.invalidURL))
            return
        }
        let request = URLRequest(url: url)
        
        service.perform(request) { result in
            switch result {
            case .success(let data):
                do {
                    let breedList = try data.decode(type: BreedList.self)
                    /// Temporary array to hold results of for-in loop
                    var dogs: [Dog] = []
                    /// Dog breed name strings gathered from api and added to new array
                    for breed in breedList.dogBreeds {
                        dogs.append(Dog(breedName: breed.key))
                    }
                    /// Complete with array of dog breed names to pass to the drop down list
                    completion(.success(dogs))
                } catch {
                    completion(.failure(.unableToDecode))
                }
            case .failure(let error):
                completion(.failure(.requestError(error)))
            }
        }
    }
    
    func fetchImageURL(from endpoint: DogEndpoints, completion: @escaping (Result <URL, NetworkError>) -> Void) {
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
    
    func fetchImage(using url: URL, completion: @escaping (Result <UIImage,NetworkError>) -> Void) {
        let request = URLRequest(url: url)
        service.perform(request) { result in
            switch result {
            case .success(let data):
                guard let image = UIImage(data: data) else {
                    return
                }
                completion(.success(image))
            case .failure:
                print("there was an error retrieving image")
                completion(.failure(.unableToDecode))
            }
        }
    }
    
}

