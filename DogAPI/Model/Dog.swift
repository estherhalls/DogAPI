//
//  Dog.swift
//  DogAPI
//
//  Created by Esther on 1/25/23.
//

import Foundation
struct Dog: Decodable {
    private enum CodingKeys: String, CodingKey {
        case status
        case dogBreed = "message"
    }
    let status: String
    // Hash map through the dogbreed dictionary?
    // I need to iterate through the keys of the nested dictionary in order to access dog breed names and create an array/list of those names
    let dogBreed: [String:[String]]
}
