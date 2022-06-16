//
//  RandomMealButton.swift
//  TastyRecipes
//
//  Created by Bartosz Wojtkowiak on 16/06/2022.
//

import SwiftUI

struct RandomMealButton: View {
    var body: some View {
        ZStack {
            Capsule()
                .fill(.white)
                .frame(width: 180, height: 60)
            
            NavigationLink(destination: RandomMealView()) {
                HStack {
                    Circle()
                        .fill(.orange)
                        .frame(width: 45, height: 45)
                        .overlay(
                            Text(">")
                                .clipShape(ContainerRelativeShape()).padding()
                                .foregroundColor(Color.white)
                        )
                    
                    Text("Random meal")
                        .foregroundColor(.orange)
                }
            }
        }
    }
}

struct RandomMealButton_Previews: PreviewProvider {
    static var previews: some View {
        RandomMealButton()
    }
}

