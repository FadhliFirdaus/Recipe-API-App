//
//  Recipe.swift
//  Recipe API App
//
//  Created by Fadhli Firdaus on 26/04/2024.
//

import Foundation

struct Recipe:Identifiable{
    let id: Int
    let name: String
    let type: String
    let image: String
    var isFavourite:Bool
    let ingredients: [String]
    let steps: [String]
    
    init(id: Int, name: String, type: String, image: String, ingredients: [String], steps: [String]) {
        self.id = id
        self.name = name
        self.type = type
        self.image = image
        self.isFavourite = false
        self.ingredients = ingredients
        self.steps = steps
    }
}
