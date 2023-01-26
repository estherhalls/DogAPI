//
//  DogEndpoints.swift
//  DogAPI
//
//  Created by Esther on 1/25/23.
//


import Foundation
extension URL {
//    // Keys for URL Components
//    /// For Dog Breed List URL
//    static let kListFirst = "breeds"
//    static let kListSecond = "list"
//    static let kListThird = "all"
//
//    /// For Dog Image URL
//    static let kImageFirst = "breed"
//    static let kImageSecond = "images"
//    static let kImageThird = "random"
    //    static let baseURL = URL(string: "https://dog.ceo/api/")
        static let allBreedsURL = URL(string: "https://dog.ceo/api/breeds/list/all")
        static let imagesBaseURL = URL(string: "https://dog.ceo/api/breed")
}
enum DogEndpoints {
    case allBreedsList
    case breedImages(String)
    
    var url: URL? {
        // Unwrap URL as var so it can be mutated
        guard let dogListURL = URL.allBreedsURL else { return nil }
        guard var imagesURL = URL.imagesBaseURL else { return nil }
        
        switch self {
        case .allBreedsList:
            return dogListURL
            print(dogListURL)
            
        case .breedImages(let dogBreed):
            imagesURL.appendPathComponent(dogBreed)
            imagesURL.appendPathComponent("images")
            return imagesURL
            print(imagesURL)
        }
    }
    // Create URL Endpoint cases for list of dog breed names and individual dog breed image array of URL strings
    
    
    //    // MARK: - URL
    //    // Base URL
    //    /// private for this file but public to other functions in this file. If we wanted other endpoints on this API, they'd use this same base URL but require a different fetch function.
    //    private static let baseURLString = "https://dog.ceo/api"
    //
    //    // Keys for URL Components
    //    /// For Dog Breed List URL
    //    private static let kBreedsComponent = "breeds"
    //    private static let kListComponent = "list"
    //    private static let kAllComponent = "all"
    //
    //    /// For Dog Image URL
    //    private static let kBreedComponent = "breed"
    //    private static let kImagesComponent = "images"
    //    private static let kRandomComponent = "random"
    //
    //    // MARK: - URL Creation for Dog API Network Calls
    //    // Dog Breed Name List
    //    static func fetchPupsList(completion: @escaping (Result <Dog, NetworkError>) -> Void) {
    //        // Step 1: Get baseURL
    //        guard let baseURL = URL(string: baseURLString) else {
    //            completion(.failure(.invalidURL(baseURLString)))
    //            return
    //        }
    //        // Compose Final URL with URLComponents
    //        let finalURL = baseURL.appending(components: kBreedsComponent, kListComponent, kAllComponent)
    //
    //        print(finalURL)
    //    }
    //
    //    // Dog image endpoint to return one random image from the specific breed image array
    //    /// To access the entire array, construct this URL without the final "random" component
    //    static func fetchPupImage(with dogBreed: String, completion: @escaping (Result <UIImage, NetworkError>) -> Void) {
    //        // Step 1: Get baseURL
    //        guard let baseURL = URL(string: baseURLString) else {
    //            completion(.failure(.invalidURL(baseURLString)))
    //            return
    //        }
    //        // Compose Final URL with URLComponents
    //        let breedURL = baseURL.appending(path: kBreedComponent)
    //        let inputBreedURL = breedURL.appending(path: dogBreed)
    //        let imagesURL = inputBreedURL.appending(path: kImagesComponent)
    //        let finalURL = imagesURL.appending(path: kRandomComponent)
    //
    //        print(finalURL)
    //    }
    
}
