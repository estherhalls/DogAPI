//
//  DogViewModel.swift
//  DogAPI
//
//  Created by Esther on 1/25/23.
//

import SwiftUI
import Combine
//protocol DogViewDelegate:

class DogViewModel: ObservableObject {
    
    // MARK: - Properties
    private let service: DogServiceable
    
    @Published var dogs: [Dog] = []
    
    // Dependency Injection
    init(service: DogServiceable = DogService()) {
        self.service = service
    }
    
    // MARK: - Methods
    func loadDogListResults() {
        service.fetchBreedsList(from: .allBreedsList) { [weak self] result in
            switch result {
            case .success(let dogs):
                DispatchQueue.main.async {
                    /// Sorted Alphabetically
                    self?.dogs = dogs.sorted(by: { $0.breedName < $1.breedName } )
                    self?.fetchImages()
                }
                
            case .failure(let error):
                print("Error fetching dog list data!", error.localizedDescription)
            }
        }
    }
    
    func loadImage(for dog: Dog) {
        service.fetchImageURL(from: .breedRandomImage(dog.breedName)) { [weak self] result in
            switch result {
            case .success(let url):
                self?.service.fetchImage(using: url) { result in
                    switch result {
                    case .success(let image):
                        DispatchQueue.main.async {
                            dog.image = image
                            self?.objectWillChange.send()
                        }
                        
                    case .failure(let error):
                        print("Error fetching dog image", error.localizedDescription)
                    }
                }
        
            case .failure(let error):
                print("Error fetching image data!", error.localizedDescription)
            }
        }
    }
    
    func fetchImages() {
        for dog in dogs {
            loadImage(for: dog)
        }
    }
}
