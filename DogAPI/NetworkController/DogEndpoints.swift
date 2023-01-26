//
//  DogEndpoints.swift
//  DogAPI
//
//  Created by Esther on 1/25/23.
//


import UIKit
struct DogEndpoints {
    
    // MARK: - URL
    // Base URL
    /// private for this file but public to other functions in this file. If we wanted other endpoints on this API, they'd use this same base URL but require a different fetch function.
    private static let baseURLString = "https://dog.ceo/api"
    
    // Keys for URL Components
    /// For Dog Breed List URL
    private static let kBreedsComponent = "breeds"
    private static let kListComponent = "list"
    private static let kAllComponent = "all"
    
    /// For Dog Image URL
    private static let kBreedComponent = "breed"
    private static let kImagesComponent = "images"
    private static let kRandomComponent = "random"
    
    // MARK: - URL Creation for Dog API Network Calls
    // Dog Breed Name List
    static func fetchPupsList(completion: @escaping (Result <Dog, NetworkError>) -> Void) {
        // Step 1: Get baseURL
        guard let baseURL = URL(string: baseURLString) else {
            completion(.failure(.invalidURL(baseURLString)))
            return
        }
        // Compose Final URL with URLComponents
        let finalURL = baseURL.appending(components: kBreedsComponent, kListComponent, kAllComponent)
        
        print(finalURL)
    }
    
    // Dog image endpoint to return one random image from the specific breed image array
    /// To access the entire array, construct this URL without the final "random" component
    static func fetchPupImage(with dogBreed: String, completion: @escaping (Result <UIImage, NetworkError>) -> Void) {
        // Step 1: Get baseURL
        guard let baseURL = URL(string: baseURLString) else {
            completion(.failure(.invalidURL(baseURLString)))
            return
        }
        // Compose Final URL with URLComponents
        let breedURL = baseURL.appending(path: kBreedComponent)
        let inputBreedURL = breedURL.appending(path: dogBreed)
        let imagesURL = inputBreedURL.appending(path: kImagesComponent)
        let finalURL = imagesURL.appending(path: kRandomComponent)
        
        print(finalURL)
    }
    
}
