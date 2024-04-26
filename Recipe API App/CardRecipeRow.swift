    //
    //  CardRecipeRow.swift
    //  Recipe API App
    //
    //  Created by Fadhli Firdaus on 26/04/2024.
    //

import SwiftUI

struct CardRecipeRow: View {
    @State var recipe:Recipe
    var size:CGFloat = 120
    var body: some View {
        ZStack{
            GeometryReader{ reader in
                Image("\(recipe.image)")
                    .resizable()
                    .scaledToFill()
                    .frame(width: sw/2.5, height:size )
                    .mask {
                        UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(topLeading: 12, bottomLeading: 12, bottomTrailing: 0, topTrailing: 0))
                    }
                HStack {
                    Spacer()
                    ZStack {
                        VStack {
                            Spacer()
                            Text("\(recipe.name)")
                                .fontWeight(.bold)
                                .lineLimit(1)
                                .customFont(.georgia, size: 16)
                                .fixedSize()
                                .background {
                                    UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(topLeading: 6, bottomLeading: 0, bottomTrailing: 0, topTrailing: 12))
                                        .foregroundColor(.white)
                                        .scaleEffect(1.2)
                                }
                                .offset(x: sw/10)
                        }
                    }
                }
                .frame(width: sw/2.5)
                VStack (alignment: .leading){
                    HStack{
                        Text("Ingredients : \(recipe.ingredients.count)")
                    }
                    Text("Steps : \(recipe.steps.count)")
                }
                .offset(x: reader.size.width/2)
                .padding(6)
            }
            @State var imageSymbol = recipe.isFavourite ? "heart.fill":"heart"
            Button {
                recipe.isFavourite.toggle()
            } label: {
                Image(systemName: imageSymbol)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24, alignment: .center)
                    .foregroundStyle(.gray)
            }
            .offset(CGSize(width: sw/2 - 33 , height: size/2 - 21))
        }
        .frame(height: size, alignment: .center)
        .mask {
            RoundedRectangle(cornerRadius: 12)
        }
        .background{
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(Color(hex: 0xFFFFFF))
        }
        
        .padding([.leading, .trailing], 12)

    }
}

#Preview {
    CardRecipeRow(recipe: .init(id: 1, name: "lasagna", type: "", image: "lasagna", ingredients: [], steps: []))
}
