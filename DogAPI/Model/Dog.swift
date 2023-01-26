//
//  Dog.swift
//  DogAPI
//
//  Created by Esther on 1/25/23.
//

import Foundation

struct Dog: Decodable, Hashable {
    private enum CodingKeys: String, CodingKey {
        case status
        case dogBreeds = "message"
    }
    let status: String

    // I need to iterate through the keys of the nested dictionary in order to access dog breed names and create an array/list of those names
    let dogBreeds: [String:[String]]
}

