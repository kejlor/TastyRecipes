//
//  TastyRecipesApp.swift
//  TastyRecipes
//
//  Created by Bartosz Wojtkowiak on 12/06/2022.
//

import SwiftUI

@main
struct TastyRecipesApp: App {
    @StateObject private var vm = MealViewModel(networkService: NetworkServiceFactory.create())
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vm)
        }
    }
}
