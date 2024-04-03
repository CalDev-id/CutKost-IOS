//
//  KosKitaApp.swift
//  KosKita
//
//  Created by Heical Chandra on 24/03/24.
//

import SwiftUI

@main
struct KosKitaApp: App {
    
    @StateObject var recipeViewModel: RecipeViewModel = RecipeViewModel()
    @StateObject var deckViewModel: DeckViewModel = DeckViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
//                MainView()
                OnboardView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(recipeViewModel)
            .environmentObject(deckViewModel)
        }
    }
}
