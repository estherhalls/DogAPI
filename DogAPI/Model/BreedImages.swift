//
//  BreedImages.swift
//  DogAPI
//
//  Created by Esther on 1/26/23.
//

import Foundation

struct BreedImages: Decodable {
    private enum CodingKeys: String, CodingKey {
        case status
        case image = "message"
    }
    let status: String

    // I need to iterate through the keys of the nested dictionary in order to access dog breed names and create an array/list of those names
    let image: String
}
