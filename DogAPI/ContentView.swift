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
//    private let service: NetworkController
    let boxes:[Box] = [
    Box(id: <#T##Int#>, title: <#T##String#>, imageURL: <#T##String#>),
    Box(id: <#T##Int#>, title: <#T##String#>, imageURL: <#T##String#>),
    Box(id: <#T##Int#>, title: <#T##String#>, imageURL: <#T##String#>),
    ]
    var topLevel: Dog?

    var body: some View {
        NavigationView {
            Text("Hello")
                .navigationBarTitle(Text("Dog Breeds"))
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
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
