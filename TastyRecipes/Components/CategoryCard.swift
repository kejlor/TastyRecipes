//
//  CategoryCard.swift
//  TastyRecipes
//
//  Created by Bartosz Wojtkowiak on 16/06/2022.
//

import SwiftUI

struct CategoryCard: View {
    var categoryName: String
    var emoji: String
    
    var body: some View {
        ZStack {
            Card()
            
            VStack {
                Text(emoji)
                    .font(.system(size: 55))
                Text(categoryName)
            }
        }
    }
}

struct CategoryCard_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCard(categoryName: "Beef", emoji: "🐮")
    }
}
