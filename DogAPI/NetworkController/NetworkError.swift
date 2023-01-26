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
    case requestError(Error)
    case noData
    case unableToDecode
    case couldNotUnwrap
    
    var errorDescription: String? {
        switch self {
        case .invalidURL(let url):
            return "Unable to reach the server. Please try again.\(url)"
        case .requestError(let error):
            return "Error performing the task: \(error.localizedDescription)"
        case .noData:
            return "The server responded with no data. Please try again."
        case .unableToDecode:
            return "The server responded with bad data. Please try again."
        case .couldNotUnwrap:
            return "Error parsing requested data"
        }
    }
} // End of Enum
