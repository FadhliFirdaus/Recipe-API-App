    //
    //  ViewModel.swift
    //  Recipe API App
    //
    //  Created by Fadhli Firdaus on 26/04/2024.
    //

import Foundation
import CoreData

class ViewModel:ObservableObject {
    
    static let shared = ViewModel()
    
    @Published var datasource = [Recipe]()
    @Published var dataType:DataSourceType = .savedCoreData
    @Published var isFetchingData = false
    
    init(){
    }
    
    static var mockRecipe = Recipe(id: 1, name: "Spaghetti Carbonara", type: "Pasta", image: "spaghetti_carbonara", isFavourite: false, ingredients: ["Spaghetti", "Bacon", "Eggs", "Parmesan Cheese", "Black Pepper"], steps: ["Cook spaghetti according to package instructions.", "In a separate pan, cook bacon until crispy.", "In a bowl, mix eggs, grated Parmesan cheese, and black pepper.", "Combine cooked spaghetti and bacon in the pan, then add the egg mixture, stirring quickly to coat the spaghetti.", "Serve hot with extra Parmesan cheese and black pepper."])
    
    func fetchFilteredData(filterString: String, completion: @escaping () -> Void) {
        resetData()
        isFetchingData = true
        let filteredRecipes = mockRecipes.filter { recipe in
            let lowercasedFilter = filterString.lowercased()
            return recipe.name.lowercased().contains(lowercasedFilter) ||
            recipe.type.lowercased().contains(lowercasedFilter) ||
            recipe.ingredients.contains { $0.lowercased().contains(lowercasedFilter)
            }
        }
        datasource = filteredRecipes
        isFetchingData = false
        completion()
    }
    
    
    
    
    private func fetchMockData(completion: @escaping () -> Void){
        resetData()
        isFetchingData = true
        DispatchQueue.global().asyncAfter(deadline: .now() + 0) {
            DispatchQueue.main.async {
                self.datasource = self.mockRecipes
                self.isFetchingData = false
                completion()
            }
        }
    }
    
    private func resetData(){
        self.datasource = []
    }
    
    private func fetchAPIData(){
        resetData()
        var fetchedData = [Recipe]()
        isFetchingData = true
        APIManager.fetchDataFromAPI { main, err in
            if(err == nil){
                if let results = main?.results {
                    for item in results {
                        let name = item.name ?? "lasagna"
                        let type = item.tags?.first?.name ?? "dessert"
                        let image = item.thumbnailURL ?? "lasagna"
                        let ingredients = item.sections?[0].components?.compactMap { $0.ingredient?.displaySingular?.capitalized } ?? []
                        let steps = item.instructions?.compactMap { $0.displayText } ?? []
                        let favourite = self.checkIfFavourited(with: item.name ?? "")
                        let apiRecipe = Recipe(
                            id: item.id ?? -1,
                            name: name,
                            type: type,
                            image: image,
                            isFavourite: favourite,
                            ingredients: ingredients,
                            steps: steps
                        )
                        fetchedData.append(apiRecipe)
                    }
                }
                
                DispatchQueue.main.async {
                    self.datasource = fetchedData
                    self.isFetchingData = false
                }
            } else {
                print(err!)
                self.isFetchingData = false
            }
        }
    }
    
    func fetchDataWithCurrentSetting(){
        switch dataType {
        case .APIFetched:
            fetchAPIData()
        case .hardcodedMockData:
            fetchMockData(completion: {})
        case .savedCoreData:
            fetchCoreDataData()
        }
    }
    
    func changeDatasourceSettings(to:DataSourceType){
        self.dataType = to
    }
    
    let mockRecipes: [Recipe] = [
        Recipe(id: 1, name: "Spaghetti Carbonara", type: "Pasta", image: "spaghetti_carbonara", isFavourite: false, ingredients: ["Spaghetti", "Bacon", "Eggs", "Parmesan Cheese", "Black Pepper"], steps: ["Cook spaghetti according to package instructions.", "In a separate pan, cook bacon until crispy.", "In a bowl, mix eggs, grated Parmesan cheese, and black pepper.", "Combine cooked spaghetti and bacon in the pan, then add the egg mixture, stirring quickly to coat the spaghetti.", "Serve hot with extra Parmesan cheese and black pepper."]),
        Recipe(id: 2, name: "Chicken Alfredo", type: "Pasta", image: "chicken_alfredo", isFavourite: false, ingredients: ["Fettuccine", "Chicken Breast", "Heavy Cream", "Butter", "Garlic", "Parmesan Cheese"], steps: ["Cook fettuccine according to package instructions.", "Season chicken breast with salt and pepper, then cook until golden brown and fully cooked.", "In a saucepan, melt butter and sauté minced garlic until fragrant.", "Add heavy cream and grated Parmesan cheese, stirring until the sauce thickens.", "Slice cooked chicken breast and add it to the sauce.", "Serve hot over cooked fettuccine."]),
        Recipe(id: 3, name: "Caprese Salad", type: "Salad", image: "caprese_salad", isFavourite: false, ingredients: ["Tomatoes", "Fresh Mozzarella", "Basil Leaves", "Balsamic Vinegar", "Extra Virgin Olive Oil", "Salt", "Black Pepper"], steps: ["Slice tomatoes and fresh mozzarella into rounds.", "Arrange alternating slices of tomatoes and mozzarella on a plate.", "Tuck basil leaves between the tomato and mozzarella slices.", "Drizzle with balsamic vinegar and extra virgin olive oil.", "Season with salt and black pepper to taste.", "Serve immediately."]),
        Recipe(id: 4, name: "Margarita Pizza", type: "Pizza", image: "margarita_pizza", isFavourite: false, ingredients: ["Pizza Dough", "Tomato Sauce", "Fresh Mozzarella", "Fresh Basil", "Extra Virgin Olive Oil", "Salt", "Black Pepper"], steps: ["Preheat oven to 475°F (245°C).", "Stretch out pizza dough on a baking sheet or pizza stone.", "Spread tomato sauce evenly over the dough.", "Tear fresh mozzarella into pieces and distribute evenly over the sauce.", "Top with fresh basil leaves.", "Drizzle with extra virgin olive oil and season with salt and black pepper.", "Bake in the preheated oven for 10-12 minutes, or until the crust is golden brown and the cheese is bubbly and melted."]),
        Recipe(id: 5, name: "Chocolate Chip Cookies", type: "Dessert", image: "chocolate_chip_cookies", isFavourite: false, ingredients: ["All-Purpose Flour", "Butter", "Brown Sugar", "Granulated Sugar", "Eggs", "Vanilla Extract", "Baking Soda", "Salt", "Chocolate Chips"], steps: ["Preheat oven to 375°F (190°C).", "In a mixing bowl, cream together softened butter, brown sugar, and granulated sugar until light and fluffy.", "Add eggs one at a time, beating well after each addition.", "Stir in vanilla extract.", "In a separate bowl, whisk together flour, baking soda, and salt.", "Gradually add the dry ingredients to the wet ingredients, mixing until just combined.", "Fold in chocolate chips.", "Drop spoonfuls of dough onto a baking sheet lined with parchment paper.", "Bake for 8-10 minutes, or until the edges are golden brown.", "Let cool on the baking sheet for a few minutes before transferring to a wire rack to cool completely."]),
        Recipe(id: 6, name: "Lasagna", type: "Main Course", image: "lasagna", isFavourite: false, ingredients: ["Lasagna noodles", "Ground beef or tofu (for vegetarian option)", "Onion, chopped", "Garlic cloves, minced", "Tomato sauce", "Ricotta cheese", "Mozzarella cheese, shredded", "Parmesan cheese, grated", "Italian seasoning", "Salt and pepper to taste", "Olive oil"], steps: ["Preheat oven to 375°F (190°C).", "Cook lasagna noodles according to package instructions until al dente. Drain and set aside.", "In a large skillet, heat olive oil over medium heat. Add chopped onions and minced garlic, sauté until onions are translucent.", "Add ground beef (or tofu) to the skillet, cook until browned. Season with Italian seasoning, salt, and pepper.", "Stir in tomato sauce and let simmer for 10 minutes.", "In a separate bowl, mix together ricotta cheese, half of the shredded mozzarella cheese, and half of the grated Parmesan cheese.", "In a baking dish, spread a layer of the meat sauce mixture on the bottom.", "Place a layer of cooked lasagna noodles over the sauce.", "Spread a layer of the cheese mixture over the noodles.", "Repeat the layers until all ingredients are used, ending with a layer of sauce on top.", "Sprinkle the remaining shredded mozzarella and grated Parmesan cheese over the top layer.", "Cover the baking dish with aluminum foil and bake for 25-30 minutes.", "Remove the foil and bake for an additional 10 minutes, or until cheese is bubbly and golden brown.", "Let cool for a few minutes before slicing and serving."])
    ]
    
        //MARK: CoreData implementations
    
    
    
    
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "FavouriteRecipes")
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }
        }
        return container
    }()
    
    func fetchCoreDataData() {
        datasource.removeAll()
        var recipes = [Recipe]()
        let fetchRequest: NSFetchRequest<FavouriteRecipe> = FavouriteRecipe.fetchRequest()
        
        do {
            let fetchedData = try persistentContainer.viewContext.fetch(fetchRequest)
            for favouriteRecipe in fetchedData {
                let recipe = parseToRecipe(favouriteRecipe: favouriteRecipe)
                recipes.append(recipe)
            }
            datasource = recipes
        } catch {
            print("Error fetching data: \(error)")
        }
    }

    
    func saveFavoriteRecipe(recipe: Recipe) {
        let context = persistentContainer.viewContext
        let favoriteRecipe = FavouriteRecipe(context: context)
        favoriteRecipe.id = Int16(recipe.id)
        favoriteRecipe.name = recipe.name
        favoriteRecipe.type = recipe.type
        favoriteRecipe.image = recipe.image
        favoriteRecipe.isFavourite = true
        favoriteRecipe.steps = recipe.steps.joined(separator: "|")
        favoriteRecipe.ingredients = recipe.ingredients.joined(separator: "|")
        
        do {
            try context.save()
            print("saved done")
        } catch {
            print("Failed to save favorite recipe: \(error)")
        }
    }
    
    func deleteData(recipe: Recipe) {
        if let parsed = parseToFavourite(recipe: recipe) {
            let context = persistentContainer.viewContext
            context.delete(parsed)
            
            do {
                datasource.removeAll { $0.name == recipe.name }
                try context.save()
            } catch {
                print("Failed to delete the saved data: \(error)")
            }
        } else {
            print("FavouriteRecipe not found for the provided Recipe.")
        }
    }

    func parseToFavourite(recipe: Recipe) -> FavouriteRecipe? {
        let context = persistentContainer.viewContext
        let request: NSFetchRequest<FavouriteRecipe> = FavouriteRecipe.fetchRequest()
        request.predicate = NSPredicate(format: "name == %@", recipe.name)
        
        do {
            let results = try context.fetch(request)
            return results.first
        } catch {
            print("Error fetching FavouriteRecipe: \(error)")
            return nil
        }
    }

    
    func parseToFavourite(recipe: Recipe) -> FavouriteRecipe {
        let context = persistentContainer.viewContext
        let favouriteRecipe = FavouriteRecipe(context: context)
        favouriteRecipe.name = recipe.name
        favouriteRecipe.type = recipe.type
        favouriteRecipe.image = recipe.image
        favouriteRecipe.isFavourite = true
        favouriteRecipe.steps = recipe.steps.joined(separator: "|")
        favouriteRecipe.ingredients = recipe.ingredients.joined(separator: "|")
        return favouriteRecipe
    }
    
    func parseToRecipe(favouriteRecipe: FavouriteRecipe) -> Recipe {
        if let ingredientsString = favouriteRecipe.ingredients,
           let stepsString = favouriteRecipe.steps {
            let ingredients = ingredientsString.split(separator: "|").map { String($0) }
            let steps = stepsString.split(separator: "|").map { String($0) }
            
            return Recipe(
                id: favouriteRecipe.id.hashValue ,
                name: favouriteRecipe.name ?? "",
                type: favouriteRecipe.type ?? "",
                image: favouriteRecipe.image ?? "", 
                isFavourite: true,
                ingredients: ingredients,
                steps: steps
            )
        } else {
            return Recipe(
                id: favouriteRecipe.id.hashValue,
                name: favouriteRecipe.name ?? "",
                type: favouriteRecipe.type ?? "",
                image: favouriteRecipe.image ?? "",
                isFavourite: true,
                ingredients: [],
                steps: []
            )
        }
    }

    func deleteAllData() {
        let managedContext = persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FavouriteRecipe")
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
            try managedContext.execute(batchDeleteRequest)
            try managedContext.save()
        } catch {
            print("Error deleting all data: \(error)")
        }
    }
    
    func checkIfFavourited(with searchString: String) -> Bool {
        let managedObjectContext = persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<FavouriteRecipe> = FavouriteRecipe.fetchRequest()
        let predicate = NSPredicate(format: "name == %@", searchString)
        fetchRequest.predicate = predicate
        do {
            let matchingRecipes = try managedObjectContext.fetch(fetchRequest)
            if !matchingRecipes.isEmpty {
                print("Found matching recipes:")
                for recipe in matchingRecipes {
                    print(recipe.name ?? "Unnamed Recipe")
                }
                return true
            } else {
                print("No matching recipes found.")
                return false
            }
        } catch {
            print("Error fetching recipes: \(error)")
            return false
        }
    }

}
