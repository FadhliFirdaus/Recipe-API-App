//
//  ViewModel.swift
//  Recipe API App
//
//  Created by Fadhli Firdaus on 26/04/2024.
//

import Foundation

class ViewModel:ObservableObject {
    static let shared = ViewModel()
    
    @Published var datasource = [Recipe]()
    @Published var recipeTypes = ["Pasta", "Salad", "Pizza", "Dessert", "Main Course"]

    
    static var mockRecipe = Recipe(id: 1, name: "Spaghetti Carbonara", type: "Pasta", image: "spaghetti_carbonara", ingredients: ["Spaghetti", "Bacon", "Eggs", "Parmesan Cheese", "Black Pepper"], steps: ["Cook spaghetti according to package instructions.", "In a separate pan, cook bacon until crispy.", "In a bowl, mix eggs, grated Parmesan cheese, and black pepper.", "Combine cooked spaghetti and bacon in the pan, then add the egg mixture, stirring quickly to coat the spaghetti.", "Serve hot with extra Parmesan cheese and black pepper."])
    
    func fetchData(completion: @escaping () -> Void){
        DispatchQueue.global().asyncAfter(deadline: .now() + 0) {
            let mockRecipes: [Recipe] = [
                Recipe(id: 1, name: "Spaghetti Carbonara", type: "Pasta", image: "spaghetti_carbonara", ingredients: ["Spaghetti", "Bacon", "Eggs", "Parmesan Cheese", "Black Pepper"], steps: ["Cook spaghetti according to package instructions.", "In a separate pan, cook bacon until crispy.", "In a bowl, mix eggs, grated Parmesan cheese, and black pepper.", "Combine cooked spaghetti and bacon in the pan, then add the egg mixture, stirring quickly to coat the spaghetti.", "Serve hot with extra Parmesan cheese and black pepper."]),
                Recipe(id: 2, name: "Chicken Alfredo", type: "Pasta", image: "chicken_alfredo", ingredients: ["Fettuccine", "Chicken Breast", "Heavy Cream", "Butter", "Garlic", "Parmesan Cheese"], steps: ["Cook fettuccine according to package instructions.", "Season chicken breast with salt and pepper, then cook until golden brown and fully cooked.", "In a saucepan, melt butter and sauté minced garlic until fragrant.", "Add heavy cream and grated Parmesan cheese, stirring until the sauce thickens.", "Slice cooked chicken breast and add it to the sauce.", "Serve hot over cooked fettuccine."]),
                Recipe(id: 3, name: "Caprese Salad", type: "Salad", image: "caprese_salad", ingredients: ["Tomatoes", "Fresh Mozzarella", "Basil Leaves", "Balsamic Vinegar", "Extra Virgin Olive Oil", "Salt", "Black Pepper"], steps: ["Slice tomatoes and fresh mozzarella into rounds.", "Arrange alternating slices of tomatoes and mozzarella on a plate.", "Tuck basil leaves between the tomato and mozzarella slices.", "Drizzle with balsamic vinegar and extra virgin olive oil.", "Season with salt and black pepper to taste.", "Serve immediately."]),
                Recipe(id: 4, name: "Margarita Pizza", type: "Pizza", image: "margarita_pizza", ingredients: ["Pizza Dough", "Tomato Sauce", "Fresh Mozzarella", "Fresh Basil", "Extra Virgin Olive Oil", "Salt", "Black Pepper"], steps: ["Preheat oven to 475°F (245°C).", "Stretch out pizza dough on a baking sheet or pizza stone.", "Spread tomato sauce evenly over the dough.", "Tear fresh mozzarella into pieces and distribute evenly over the sauce.", "Top with fresh basil leaves.", "Drizzle with extra virgin olive oil and season with salt and black pepper.", "Bake in the preheated oven for 10-12 minutes, or until the crust is golden brown and the cheese is bubbly and melted."]),
                Recipe(id: 5, name: "Chocolate Chip Cookies", type: "Dessert", image: "chocolate_chip_cookies", ingredients: ["All-Purpose Flour", "Butter", "Brown Sugar", "Granulated Sugar", "Eggs", "Vanilla Extract", "Baking Soda", "Salt", "Chocolate Chips"], steps: ["Preheat oven to 375°F (190°C).", "In a mixing bowl, cream together softened butter, brown sugar, and granulated sugar until light and fluffy.", "Add eggs one at a time, beating well after each addition.", "Stir in vanilla extract.", "In a separate bowl, whisk together flour, baking soda, and salt.", "Gradually add the dry ingredients to the wet ingredients, mixing until just combined.", "Fold in chocolate chips.", "Drop spoonfuls of dough onto a baking sheet lined with parchment paper.", "Bake for 8-10 minutes, or until the edges are golden brown.", "Let cool on the baking sheet for a few minutes before transferring to a wire rack to cool completely."]),
                Recipe(id: 6, name: "Lasagna", type: "Main Course", image: "lasagna", ingredients: ["Lasagna noodles", "Ground beef or tofu (for vegetarian option)", "Onion, chopped", "Garlic cloves, minced", "Tomato sauce", "Ricotta cheese", "Mozzarella cheese, shredded", "Parmesan cheese, grated", "Italian seasoning", "Salt and pepper to taste", "Olive oil"], steps: ["Preheat oven to 375°F (190°C).", "Cook lasagna noodles according to package instructions until al dente. Drain and set aside.", "In a large skillet, heat olive oil over medium heat. Add chopped onions and minced garlic, sauté until onions are translucent.", "Add ground beef (or tofu) to the skillet, cook until browned. Season with Italian seasoning, salt, and pepper.", "Stir in tomato sauce and let simmer for 10 minutes.", "In a separate bowl, mix together ricotta cheese, half of the shredded mozzarella cheese, and half of the grated Parmesan cheese.", "In a baking dish, spread a layer of the meat sauce mixture on the bottom.", "Place a layer of cooked lasagna noodles over the sauce.", "Spread a layer of the cheese mixture over the noodles.", "Repeat the layers until all ingredients are used, ending with a layer of sauce on top.", "Sprinkle the remaining shredded mozzarella and grated Parmesan cheese over the top layer.", "Cover the baking dish with aluminum foil and bake for 25-30 minutes.", "Remove the foil and bake for an additional 10 minutes, or until cheese is bubbly and golden brown.", "Let cool for a few minutes before slicing and serving."])
            ]
            
            DispatchQueue.main.async {
                self.datasource = mockRecipes
                completion()
            }
        }
    }
}
