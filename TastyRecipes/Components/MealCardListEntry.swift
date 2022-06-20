//
//  MealCardListEntry.swift
//  TastyRecipes
//
//  Created by Bartosz Wojtkowiak on 18/06/2022.
//

import SwiftUI

struct MealCardListEntry: View {
    var url: String
    var title: String
    var id: String
    
    var body: some View {
        HStack {
            DownloadingImageView(url: url, key: id)
                .frame(width: 100, height: 100)
            
            Text(title)
                .foregroundColor(.orange)
            
            Spacer()
            
            Image(systemName: "arrow.right.square")
                .foregroundColor(.orange)
                .font(.title)
        }
    }
}

struct MealCardListEntry_Previews: PreviewProvider {
    static var previews: some View {
        MealCardListEntry(url: "https://www.themealdb.com/images/media/meals/1548772327.jpg", title: "Baked salmon with fennel & tomatoes", id: "52959")
    }
}
