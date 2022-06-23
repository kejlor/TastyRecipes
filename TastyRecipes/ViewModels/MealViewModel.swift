//
//  MealViewModel.swift
//  TastyRecipes
//
//  Created by Bartosz Wojtkowiak on 14/06/2022.
//

import Foundation
import Combine

class MealViewModel: ObservableObject {
    @Published var allMeals: Meals = Meals(meals: [Meal]())
    @Published var categorizedMeals: Meals = Meals(meals: [Meal]())
    @Published var randomMeal: Meals = Meals(meals: [Meal]())
    @Published var selectedMeal: Meals = Meals(meals: [Meal]())
    @Published var searchText = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    var networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
        debounceAfterSearching()
    }
    
    private func debounceAfterSearching() {
        $searchText
            .debounce(for: .seconds(1), scheduler: DispatchQueue.main)
            .sink { searchText in
                self.allMeals = Meals(meals: [Meal]())
                if(searchText.count > 3) {
                    self.getMealByName()
                }
            }
            .store(in: &cancellables)
    }
    
    func getMealByName() {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/search.php?s=\(searchText)") else { return }
        
        self.networkService.downloadData(of: Meals.self, from: url) { (result) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let meals):
                DispatchQueue.main.async {
                    self.allMeals = meals
                }
            }
        }
    }
    
    func getMealById(id: String) {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(id)") else { return }
        
        self.networkService.downloadData(of: Meals.self, from: url) { (result) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let meals):
                DispatchQueue.main.async {
                    self.selectedMeal = meals
                }
            }
        }
    }
    
    func getRandomMeal() {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/random.php") else { return }
        
        self.networkService.downloadData(of: Meals.self, from: url) { (result) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let meals):
                DispatchQueue.main.async {
                    self.randomMeal = meals
                }
            }
        }
    }
        
    func getMealsByCategory(category: String) {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=\(category)") else { return }
        
        self.networkService.downloadData(of: Meals.self, from: url) { (result) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let meals):
                DispatchQueue.main.async {
                    self.categorizedMeals = meals
                }
            }
        }
    }
}
