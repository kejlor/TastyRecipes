//
//  ContentView.swift
//  TastyRecipes
//
//  Created by Bartosz Wojtkowiak on 12/06/2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var vm: MealViewModel
        
    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    MoveToSearchViewButton()
                    
                    GreetingCard()
                    
                    RandomMealButton()
                        .offset(y: -40)
                    
                    CategoriesHorizontalList()
                }
                .padding()
            }
        }
        .onAppear() { vm.getRandomMeal() }
        .background(.regularMaterial)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
