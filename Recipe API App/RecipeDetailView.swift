    //
    //  RecipeDetailView.swift
    //  Recipe API App
    //
    //  Created by Fadhli Firdaus on 26/04/2024.
    //

import SwiftUI
import SwiftUI

struct RecipeDetailView: View {
    
    @State var recipe: Recipe = ViewModel.mockRecipe
    @State private var recipeImage: UIImage? = nil
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Rectangle()
                    .shadow(radius: 12)
                if let validURL = URL(string: recipe.image), validURL.scheme != nil {
                    if let image = recipeImage {
                            // Display the fetched image
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: sw * 1.25, height: sh/2.5, alignment: .center)
                            .mask(
                                LinearGradient(gradient: Gradient(colors: [.white.opacity(0.15), .white, .white, .white.opacity(0.15)]),
                                               startPoint: .topLeading,
                                               endPoint: .bottomTrailing)
                            )
                    } else {
                        ZStack {
                            Image("lasagna") 
                                .resizable()
                                .scaledToFill()
                                .frame(width: sw * 1.25, height: sh/2.5, alignment: .center)
                                .overlay (
                                    LinearGradient(gradient: Gradient(colors: [.white.opacity(0.15), .white, .white, .white.opacity(0.15)]),
                                                   startPoint: .topLeading,
                                                   endPoint: .bottomTrailing)
                                )
                            
                            ProgressView() // Overlay ProgressView
                        }
                        .onAppear {
                            loadImage(from: recipe.image)
                        }
                    }
                } else {
                    Image(recipe.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: sw * 1.25, height: sh/2.5, alignment: .center)
                        .mask(
                            LinearGradient(gradient: Gradient(colors: [.white.opacity(0.15), .white, .white, .white.opacity(0.15)]),
                                           startPoint: .topLeading,
                                           endPoint: .bottomTrailing)
                        )
                }

                
            }
            .frame(width: sw, height: sh/3.5, alignment: .center)
            .edgesIgnoringSafeArea(.all)
            .overlay {
                VStack {
                    Spacer()
                    HStack{
                        Spacer()
                        Button(action: {
                            recipe.isFavourite.toggle()
                        }, label: {
                            if recipe.isFavourite {
                                Image(systemName: "heart.circle.fill")
                                    .resizable()
                                    .frame(width: 30, height: 30, alignment: .center)
                                    .foregroundColor(.red)
                                    .background(Circle()
                                        .foregroundColor(.white)
                                        .scaleEffect(1.25))
                                    .padding()
                            } else {
                                Image(systemName: "heart.circle")
                                    .resizable()
                                    .frame(width: 30, height: 30, alignment: .center)
                                    .foregroundColor(.gray)
                                    .background(Circle()
                                        .foregroundColor(.white)
                                        .scaleEffect(1.25))
                                    .padding()
                            }
                        })
                    }
                }
            }
            
            List {
                Section {
                    Text("\(recipe.name)")
                } header: {
                    Text("Menu")
                }
                
                let formattedType = recipe.type.replacingOccurrences(of: "_", with: " ").capitalized

                Section {
                    Text("\(formattedType)")
                } header: {
                    Text("Type")
                }
                
                Section {
                    ForEach(recipe.ingredients, id: \.self) { ingredient in
                        Text("\(ingredient)")
                    }
                } header: {
                    Text("Ingredients")
                }
                
                Section {
                    ForEach(recipe.steps, id: \.self) { step in
                        Text("\(step)")
                    }
                } header: {
                    Text("Steps")
                }
                
            }
            .listStyle(GroupedListStyle())
            Spacer()
            
        }
        .frame(width: sw, height: sh, alignment: .top)
    }
    
    private func loadImage(from urlString: String) {
            // Convert the string URL to a URL object
        guard let url = URL(string: urlString) else {
            print("Invalid URL: \(urlString)")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error loading image: \(error.localizedDescription)")
                return
            }
            
                // Check for response status code
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Invalid response or status code")
                return
            }
            
                // Check if data is available
            guard let imageData = data else {
                print("No image data received")
                return
            }
            
                // Convert data to UIImage
            if let uiImage = UIImage(data: imageData) {
                DispatchQueue.main.async {
                        // Update recipeImage state variable with the loaded image
                    recipeImage = uiImage
                }
            } else {
                print("Failed to convert data to UIImage")
            }
        }.resume()
    }


    
}


#Preview {
    RecipeDetailView(recipe: ViewModel.mockRecipe)
}




