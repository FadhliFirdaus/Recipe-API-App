    //
    //  RecipeDetailView.swift
    //  Recipe API App
    //
    //  Created by Fadhli Firdaus on 26/04/2024.
    //

import SwiftUI

struct RecipeDetailView: View {
    @State var recipe:Recipe = ViewModel.mockRecipe
    var body: some View {
        VStack(spacing:0){
            ZStack {
                Rectangle()
                    .shadow(radius: 12)
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
                
                Section {
                    Text("\(recipe.type)")
                } header: {
                    Text("Type")
                }
                
                Section {
                    ForEach(recipe.ingredients, id:\.self){ingredient in
                        Text("\(ingredient)")
                    }
                } header: {
                    Text("Ingredients")
                }
                Section {
                    ForEach(recipe.steps, id:\.self){step in
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
}

#Preview {
    RecipeDetailView(recipe: ViewModel.mockRecipe)
}




