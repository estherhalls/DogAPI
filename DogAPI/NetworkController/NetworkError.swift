//
//  NetworkError.swift
//  DogAPI
//
//  Created by Esther on 1/25/23.
//

import Foundation

// Error Object for throwing errors on concurrent tasks
enum NetworkError: Error, LocalizedError {
    
    case invalidURL(String)
    case thrownError(Error)
    case noData
    case unableToDecode
    
    var errorDescription: String? {
        switch self {
        case .invalidURL(let url):
            return "Unable to reach the server. Please try again.\(url)"
        case .thrownError(let error):
            return "Error: \(error.localizedDescription) -> \(error)"
        case .noData:
            return "The server responded with no data. Please try again."
        case .unableToDecode:
            return "The server responded with bad data. Please try again."
        }
    }
} // End of Enum
