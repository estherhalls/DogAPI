//
//  DogEndpoints.swift
//  DogAPI
//
//  Created by Esther on 1/25/23.
//


import Foundation

extension URL {
    static let allBreedsURL = URL(string: "https://dog.ceo/api/breeds/list/all")
    static let imagesBaseURL = URL(string: "https://dog.ceo/api/breed")
}

enum DogEndpoints {
    
    case allBreedsList
    case breedImages(String)
    
    var fullURL: URL? {
        // Unwrap URL as var so it can be mutated
        guard let dogListURL = URL.allBreedsURL else { return nil }
        guard var imagesURL = URL.imagesBaseURL else { return nil }
     
        
        switch self {
        case .allBreedsList:
            print(dogListURL)
            return dogListURL
            
        case .breedImages(let dogBreed):
            imagesURL.appendPathComponent("\(dogBreed)/images")
            print(imagesURL)
            return imagesURL
        }
    }
}
