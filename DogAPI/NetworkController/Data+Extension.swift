//
//  Data+Extension.swift
//  DogAPI
//
//  Created by Esther on 1/25/23.
//

import Foundation

extension Data {
    // Abstracted data decoding to JSON using generic structure to be reusable with data that comes from different sources
    func decode<T: Decodable>(type: T.Type, decoder: JSONDecoder = JSONDecoder()) throws -> T {
        do {
            return try decoder.decode(type.self, from: self)
        } catch {
            throw error
        }
    }
}
