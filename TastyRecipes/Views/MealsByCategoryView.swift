//
//  MealsByCategoryView.swift
//  TastyRecipes
//
//  Created by Bartosz Wojtkowiak on 16/06/2022.
//

import SwiftUI

struct MealsByCategoryView: View {
    @EnvironmentObject var vm: MealViewModel
    @State private var showMealRecipe = false
    @State private var selectedMeal: Meal? = nil
    var category: String

    var body: some View {
        VStack {
            if(vm.categorizedMeals.meals.isEmpty) {
                ProgressView()
            } else {
                List {
                    ForEach(vm.categorizedMeals.meals) { mealEntry in
                        MealCardListEntry(url: mealEntry.strMealThumb, title: mealEntry.strMeal, id: mealEntry.idMeal)
                            .onTapGesture {
                                segue(meal: mealEntry)
                            }
                    }
                }
            }
        }
        .background(
            NavigationLink(destination: MealView(meal: selectedMeal),
                           isActive: $showMealRecipe,
                           label: { EmptyView() })
        )
        .onAppear() { vm.getMealsByCategory(category: category) }
    }
}

struct MealsByCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        MealsByCategoryView(category: "Seafood")
    }
}

extension MealsByCategoryView {
    private func segue(meal: Meal) {
        selectedMeal = meal
        showMealRecipe.toggle()
    }
}
