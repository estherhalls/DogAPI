//
//  ContentView.swift
//  DogAPI
//
//  Created by Esther on 1/25/23.
//

import SwiftUI
import Combine

struct Box {
    // Use a key when iterating over object
    var id: Int
    let title, imageURL: String
}


struct ContentView: View {
    // Create an instance of view model, making sure it maintains its state over content view reloads
    @StateObject var viewModel = DogViewModel()
    
    let boxes:[Box] = [
        //    Box(id: <#T##Int#>, title: <#T##String#>, imageURL: <#T##String#>),
        //    Box(id: <#T##Int#>, title: <#T##String#>, imageURL: <#T##String#>),
        //    Box(id: <#T##Int#>, title: <#T##String#>, imageURL: <#T##String#>)
    ]
    
    var body: some View {
        NavigationView {
            List {
                // iterate over dog breed list keys
                ForEach(viewModel.dogsList, id:\.self) { dog in
                    
                    HStack {
                        Image("")
                            .frame(width: 130, height: 70)
                            .background(Color.gray)
                        
                        Text(dog.dogBreed)
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
        //        guard let dog = topLevel else { return }
        //        let dogBreedArray = dog.dogBreed
        VStack {
            
            //            Image(systemName: "globe")
            //                .imageScale(.large)
            //                .foregroundColor(.accentColor)
            //            Text("Hello, world!")
            //            Button("Previous Image") {
            //
            //            }
            //
            //            Button("Next Image") {
            //
            //            }
        }
        .padding(3)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
