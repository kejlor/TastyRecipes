//
//  MealViewModel.swift
//  TastyRecipes
//
//  Created by Bartosz Wojtkowiak on 14/06/2022.
//

import Foundation

class MealViewModel: ObservableObject {
    @Published var allMeals: Meals = Meals(meals: [Meal]())
    @Published var randomMeal: Meals = Meals(meals: [Meal]())
    
    var networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func getMealByName(name: String) {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/search.php?s=\(name)") else { return }
        
        self.networkService.downloadData(of: Meals.self, from: url) { (result) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let meals):
                self.allMeals = meals
            }
        }
    }
    
    func getRandomMeal() {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/random.php") else { return }
        
        print("getting random meal")
        
        self.networkService.downloadData(of: Meals.self, from: url) { (result) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let meals):
                self.randomMeal = meals
            }
        }
        
        print("got: \(randomMeal.meals.count)")
    }
    
    func getMealsByFirstLetter(letter: String) {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/search.php?f=\(letter)") else { return }
        
        self.networkService.downloadData(of: Meals.self, from: url) { (result) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let meals):
                self.allMeals = meals
            }
        }
    }
}
