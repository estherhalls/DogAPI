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
                
                 // iterate over dog breed list keys
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
    //    let boxes:[Box] = [
    //        //    Box(id: <#T##Int#>, title: <#T##String#>, imageURL: <#T##String#>),
    //        //    Box(id: <#T##Int#>, title: <#T##String#>, imageURL: <#T##String#>),
    //        //    Box(id: <#T##Int#>, title: <#T##String#>, imageURL: <#T##String#>)
    //    ]
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
