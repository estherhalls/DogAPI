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
   
    @Published var breedsList: [String] = []
    
    // Dependency Injection
    init(service: DogServiceable = DogService()) {
        self.service = service
    }
    // MARK: - Methods
    func loadDogListResults() {
        service.fetch(from: .allBreedsList) { [weak self] result in
//            self?.handle(breedsList: result)
                switch result {
                case .success(let breeds):
                    DispatchQueue.main.async {
                        /// Sorted Alphabetically
                        self?.breedsList = breeds.sorted(by: <)
                    }
                    
                case .failure(let error):
                    print("Error fetching dog list data!", error.localizedDescription)
        
    }
    
//    private func handle(breedsList result: Result<[String], NetworkError>) {
//        DispatchQueue.main.async {
//            switch result {
//            case .success(let breeds):
//                DispatchQueue.main.async {
//                    self.breedsList = breeds
//                }
//            case .failure(let error):
//                print("Error fetching dog list data!", error.localizedDescription)
//                self.encountered(error)
//            }
        }
    }
    // Needs to be on view controller... if view controller is a class like UIKit
//    func encountered(_ error: Error) {
//        let alertController = UIAlertController(title: "Error", message: "\(error.localizedDescription)", preferredStyle: .alert)
//        alertController.addAction(UIAlertAction(title: "Retry", style: .default, handler: { [weak self] _ in
//            self?.loadDogListResults()
//        }))
//        present(alertController, animated: true)
//    }
 
    
}
