//
//  RandomMealView.swift
//  TastyRecipes
//
//  Created by Bartosz Wojtkowiak on 16/06/2022.
//

import SwiftUI

struct RandomMealView: View {
    @EnvironmentObject var vm: MealViewModel
    var body: some View {
        VStack {
            GeometryReader { geometry in
                AsyncImage(url: URL(string: vm.randomMeal.meals[0].strMealThumb)) { image in
                    image.resizable()
                } placeholder: {
                    Color.pink
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                .clipShape(RoundedRectangle(cornerRadius: 25))
            }
            Text(vm.randomMeal.meals[0].strMeal)
            
        }
    }
}

struct RandomMealView_Previews: PreviewProvider {
    static var previews: some View {
        RandomMealView()
    }
}
