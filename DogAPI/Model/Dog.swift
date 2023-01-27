//
//  Dog.swift
//  DogAPI
//
//  Created by Esther on 1/26/23.
//

import UIKit

class Dog: Hashable, Equatable {
    
    var breedName: String
    var image: UIImage? = nil
    
    init(breedName: String) {
        self.breedName = breedName
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(breedName)
    }
    
    static func == (lhs: Dog, rhs: Dog) -> Bool {
        lhs.breedName == rhs.breedName
    }
    
}

