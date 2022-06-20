//
//  GreetingCard.swift
//  TastyRecipes
//
//  Created by Bartosz Wojtkowiak on 16/06/2022.
//

import SwiftUI

struct GreetingCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Hello!")
                .font(.title)
            Text("What do you want to cook today?")
                .foregroundColor(Color.orange)
            
            GeometryReader { geometry in
                DownloadingImageView(url: "https://images.pexels.com/photos/1095550/pexels-photo-1095550.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2", key: "mainImage")
                .frame(width: geometry.size.width, height: geometry.size.height)
                .clipShape(RoundedRectangle(cornerRadius: 25))
            }
        }
        .padding(.horizontal)
    }
}

struct GreetingCard_Previews: PreviewProvider {
    static var previews: some View {
        GreetingCard()
    }
}
