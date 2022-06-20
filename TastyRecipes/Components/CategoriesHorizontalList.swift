//
//  CategoriesHorizontalList.swift
//  TastyRecipes
//
//  Created by Bartosz Wojtkowiak on 16/06/2022.
//

import SwiftUI

struct CategoriesHorizontalList: View {
    let categories: [String : String] = ["Beef" : "🐮", "Chicken" : "🐓", "Dessert" : "🍧", "Lamb" : "🐏", "Misscellaneous" : "🥣", "Pasta" : "🍝", "Pork" : "🐷", "Seafood" : "🦐", "Side" : "🥄", "Starter" : "🍜", "Vegan" : "🥦", "Vegetarian" : "🥬", "Breakfast" : "🥪", "Goat" : "🐐"]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Categories")
                .font(.title)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(categories.sorted(by: >), id: \.key) { key, value in
                        NavigationLink(destination: MealsByCategoryView(category: key)) {
                            CategoryCard(categoryName: key, emoji: value)
                                .foregroundColor(.orange)
                        }
                    }
                }
            }
        }
        .padding()
    }
}

struct CategoriesHorizontalList_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesHorizontalList()
    }
}
