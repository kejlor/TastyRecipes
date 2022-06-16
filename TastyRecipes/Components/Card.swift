//
//  Card.swift
//  TastyRecipes
//
//  Created by Bartosz Wojtkowiak on 16/06/2022.
//

import SwiftUI

struct Card: View {
    var body: some View {
            ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.white)
            }
            .frame(width: 120, height: 140)
        }
    }

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card()
    }
}
