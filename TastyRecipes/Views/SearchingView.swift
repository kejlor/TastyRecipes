//
//  SearchingView.swift
//  TastyRecipes
//
//  Created by Bartosz Wojtkowiak on 23/06/2022.
//

import SwiftUI

struct SearchingView: View {
    @EnvironmentObject var vm: MealViewModel
    
    var body: some View {
        VStack {
            CustomSearchBar(searchText: $vm.searchText)
            
            if(vm.allMeals.meals.isEmpty) {
                Text("Can't find this dish")
                
                Spacer()
            } else {
                MealView(meal: vm.allMeals.meals[0])
            }
        }
    }
}

struct SearchingView_Previews: PreviewProvider {
    static var previews: some View {
        SearchingView()
    }
}

extension SearchingView {
    private var titleAndCard: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(vm.allMeals.meals[0].strMeal)
                .font(.title)
            
            GeometryReader { geometry in
                DownloadingImageView(url: vm.allMeals.meals[0].strMealThumb, key: vm.allMeals.meals[0].idMeal)
                    .frame(width: geometry.size.width, height: geometry.size.height)
            }
        }
        .padding(.vertical)
        .padding(.horizontal)
    }
    
    private var ingredientsAndMeasures: some View {
        HStack {
            VStack {
                Text("Ingredients")
                    .font(.title3)
                    .foregroundColor(.orange)
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .fill(.white)
                            .shadow(
                                color: Color.orange.opacity(0.15),
                                radius: 10, x: 0, y: 0)
                    )
                Text(vm.allMeals.meals[0].strIngredient1 ?? "")
                Text(vm.allMeals.meals[0].strIngredient2 ?? "")
                Text(vm.allMeals.meals[0].strIngredient3 ?? "")
                Text(vm.allMeals.meals[0].strIngredient4 ?? "")
                Text(vm.allMeals.meals[0].strIngredient5 ?? "")
            }
            
            VStack {
                Text("Measures")
                    .font(.title3)
                    .foregroundColor(.orange)
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .fill(.white)
                            .shadow(
                                color: Color.orange.opacity(0.15),
                                radius: 10, x: 0, y: 0)
                    )
                Text(vm.allMeals.meals[0].strMeasure1 ?? "")
                Text(vm.allMeals.meals[0].strMeasure2 ?? "")
                Text(vm.allMeals.meals[0].strMeasure3 ?? "")
                Text(vm.allMeals.meals[0].strMeasure4 ?? "")
                Text(vm.allMeals.meals[0].strMeasure5 ?? "")
            }
        }
        .padding()
    }
    
    private var mealPrepDescription: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Recipe")
                .font(.title)
            
            GeometryReader { geometry in
                ScrollView {
                    Text(vm.allMeals.meals[0].strInstructions ?? "")
                        .lineLimit(nil)
                        .frame(width: geometry.size.width - 50)
                        .padding()
                }
            }
        }
        .padding()
        .padding(.bottom, 20)
    }
}
