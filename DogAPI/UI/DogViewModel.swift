//
//  DogViewModel.swift
//  DogAPI
//
//  Created by Esther on 1/25/23.
//

import SwiftUI
//protocol DogViewDelegate:
                                
class DogViewModel: ObservableObject {
    
    private let service: DogServiceable
    var dog: Dog?
    @Published var dogsList: [Dog] = []
    // Dependency Injection
    init(service: DogServiceable = DogService()) {
        self.service = service
    }
    
    func loadDogListResults() {
        service.fetch(from: .allBreedsList) { [weak self] result in
            self?.handle(dogList: result)
        }
    }
    
    private func handle(dogList result: Result<Dog, NetworkError>) {
        DispatchQueue.main.async {
            switch result {
            case .success(let dog):
                DispatchQueue.main.async {
                    self.dog = dog
                    // Finish populating array or loading cells function and delegating loaded UI tasks
                    self.dogsList.append(contentsOf: [dog])
                }
            case .failure(let error):
                print("Error fetching dog list data!", error.localizedDescription)
                self.encountered(error)
            }
        }
    }
    // Needs to be on view controller... if view controller is a class like UIKit
    func encountered(_ error: Error) {
        let alertController = UIAlertController(title: "Error", message: "\(error.localizedDescription)", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Retry", style: .default, handler: { [weak self] _ in
            self?.loadDogListResults()
        }))
        present(alertController, animated: true)
    }
 
    
}
