//
//  ContentView.swift
//  DogAPI
//
//  Created by Esther on 1/25/23.
//

import SwiftUI
import Combine


struct ContentView: View {
    
    // Create an instance of view model, making sure it maintains its state over content view reloads
    @StateObject var viewModel = DogViewModel()
    
    var body: some View {
        NavigationView {
            List {
                
                // Iterate over dog breed list strings
                ForEach($viewModel.breedsList, id:\.self) { breed in
                    
                    HStack {
                        Image("")
                            .frame(width: 130, height: 70)
                            .background(Color.gray)
                        
                        Text(breed.wrappedValue)
                            .bold()
                    }
                    .padding(3)
                }
                
            }
            .navigationTitle("Dog Breeds")
            .onAppear {
                viewModel.loadDogListResults()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
