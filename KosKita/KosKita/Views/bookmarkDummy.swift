//
//  bookmarkDummy.swift
//  KosKita
//
//  Created by Heical Chandra on 02/04/24.
//

import SwiftUI

struct bookmarkDummy: View {
    @EnvironmentObject var recipeViewModel: RecipeViewModel
    @EnvironmentObject var deckViewModel: DeckViewModel
    
    var body: some View {
        VStack{
            if deckViewModel.items2.isEmpty {
                Text("kosong")
            } else {
                ForEach(deckViewModel.items2) { item in
                    DeckList(deck: item)
                }
            }
        }
    }
}

#Preview {
    NavigationView{
        bookmarkDummy()
    }.environmentObject(RecipeViewModel()).environmentObject(DeckViewModel())
}
