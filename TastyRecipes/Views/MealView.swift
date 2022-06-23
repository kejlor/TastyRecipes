//
//  MealView.swift
//  TastyRecipes
//
//  Created by Bartosz Wojtkowiak on 22/06/2022.
//

import SwiftUI

struct MealView: View {
    @EnvironmentObject var vm: MealViewModel
    var meal: Meal?
    
    var body: some View {
        VStack {
            if(vm.selectedMeal.meals.isEmpty) {
                ProgressView()
            } else {
                VStack {
                    titleAndCard
                    ingredientsAndMeasures
                    mealPrepDescription
                }
            }
        }
        .background(.regularMaterial)
        .onAppear() { vm.getMealById(id: meal?.idMeal ?? "0") }
    }
}

//struct MealView_Previews: PreviewProvider {
//    static var previews: some View {
//        MealView(meal: Meal())
//    }
//}

extension MealView {
    private var titleAndCard: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(vm.selectedMeal.meals[0].strMeal)
                .font(.title)
            
            GeometryReader { geometry in
                DownloadingImageView(url: vm.selectedMeal.meals[0].strMealThumb, key: vm.selectedMeal.meals[0].idMeal)
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
                Text(vm.selectedMeal.meals[0].strIngredient1 ?? "")
                Text(vm.selectedMeal.meals[0].strIngredient2 ?? "")
                Text(vm.selectedMeal.meals[0].strIngredient3 ?? "")
                Text(vm.selectedMeal.meals[0].strIngredient4 ?? "")
                Text(vm.selectedMeal.meals[0].strIngredient5 ?? "")
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
                Text(vm.selectedMeal.meals[0].strMeasure1 ?? "")
                Text(vm.selectedMeal.meals[0].strMeasure2 ?? "")
                Text(vm.selectedMeal.meals[0].strMeasure3 ?? "")
                Text(vm.selectedMeal.meals[0].strMeasure4 ?? "")
                Text(vm.selectedMeal.meals[0].strMeasure5 ?? "")
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
                    Text(vm.selectedMeal.meals[0].strInstructions ?? "")
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
