//
//  MealsByCategoryView.swift
//  TastyRecipes
//
//  Created by Bartosz Wojtkowiak on 16/06/2022.
//

import SwiftUI

struct MealsByCategoryView: View {
    @EnvironmentObject var vm: MealViewModel
    var category: String

    var body: some View {
        VStack {
            if(vm.categorizedMeals.meals.isEmpty) {
                ProgressView()
            } else {
                List {
                    ForEach(vm.categorizedMeals.meals) { mealEntry in
                        MealCardListEntry(url: mealEntry.strMealThumb, title: mealEntry.strMeal, id: mealEntry.idMeal)
                    }
                }
            }
        }
        .onAppear() { vm.getMealsByCategory(category: category) }
    }
}

struct MealsByCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        MealsByCategoryView(category: "Seafood")
    }
}
