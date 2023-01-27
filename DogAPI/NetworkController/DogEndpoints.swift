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
    case breedRandomImage(String)
    
    var fullURL: URL? {
        // Unwrap URL as var so it can be mutated
        guard let dogListURL = URL.allBreedsURL else { return nil }
        guard var imageURL = URL.imagesBaseURL else { return nil }
     
        
        switch self {
        case .allBreedsList:
            print(dogListURL)
            return dogListURL
            
        case .breedRandomImage(let dogBreed):
            imageURL.appendPathComponent("\(dogBreed)/images/random")
            print(imageURL)
            return imageURL
        }
    }
}
