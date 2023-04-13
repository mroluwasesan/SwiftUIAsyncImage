//
//  ContentView.swift
//  SwiftUIAsyncImage
//
//  Created by Negatron on 12/04/2023.
//

import SwiftUI
// MARK: - IMAGE EXTENSION
extension Image{
    func imageModfier() -> some View{
        self
            .resizable()
            .scaledToFit()
    }
    func iconModifier() -> some View{
        self
            .imageModfier()
            .frame(maxWidth: 128)
            .foregroundColor(.purple)
            .opacity(0.5)
    }
}

struct ContentView: View {
    private let imageURL: String = "https://credo.academy/credo-academy@3x.png"
    var body: some View {
        // MARK: - 1.BASIC
        
//       AsyncImage(url: URL(string: imageURL))
        
        // MARK: - 2.SCALE
        
//        AsyncImage(url: URL(string: imageURL),scale: 3.0)
        
        // MARK: - 3.PLACEHOLDER
        
        /*
        AsyncImage(url: URL(string: imageURL)) {image in
            image
                .imageModfier()
            
        }placeholder: {
            Image(systemName: "photo.circle.fill")
                .iconModifier()
        }
        .padding(40)
         
         */
        
        //MARK: - 4. PHASE
        /*
        AsyncImage(url: URL(string: imageURL)){phase in
//            Success: Image has successfully Loaded
//            FAILURE:  Image fail to load with an error
//            EMPTY: NO Image is loaded
            
            if let image = phase.image{
                
                image.imageModfier()
            }
            else if phase.error != nil {
                Image(systemName: "ant.circle.fill").iconModifier()
            }
            else{
                Image(systemName: "photo.circle.fill").iconModifier()
            }
        }
        .padding(40)
         */
        
        // MARK: - 5. ANIMATION
        
        AsyncImage(url: URL(string: imageURL), transaction: Transaction(animation: .spring(response: 0.5,dampingFraction: 0.6,blendDuration: 0.25))){phase in
            switch phase{
            case .success (let image): image
                    .imageModfier()
//                    .transition(.move(edge: .bottom))
                    .transition(.slide)
//                    .transition(.scale)
            case .failure (_): Image(systemName: "ant.circle.fill").iconModifier()
            case .empty:
                Image(systemName: "photo.circle.fill").iconModifier()
                
            @unknown default:
                ProgressView()
            }
        }
        .padding(40)
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
