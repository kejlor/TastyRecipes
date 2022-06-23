//
//  MoveToSearchViewButton.swift
//  TastyRecipes
//
//  Created by Bartosz Wojtkowiak on 23/06/2022.
//

import SwiftUI

struct MoveToSearchViewButton: View {
    var body: some View {
        ZStack {
            Capsule()
                .fill(.white)
                .frame(width: 180, height: 60)
            
                NavigationLink(destination: SearchingView()) {
                    HStack {
                        Circle()
                            .fill(.orange)
                            .frame(width: 45, height: 45)
                            .overlay(
                                Text(">")
                                    .clipShape(ContainerRelativeShape()).padding()
                                    .foregroundColor(Color.white)
                            )
                        
                        Text("Search for meal")
                            .foregroundColor(.orange)
                    }
                }
        }
    }
}

struct MoveToSearchViewButton_Previews: PreviewProvider {
    static var previews: some View {
        MoveToSearchViewButton()
    }
}
