//
//  MainView.swift
//  KosKita
//
//  Created by Heical Chandra on 24/03/24.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var recipeViewModel: RecipeViewModel
    
    var body: some View {
        ScrollView {
            VStack {
    //            RecipeList(item: RecipeModel(title: "Wagyu A5", image: "steak", ingridients: ["daging", "rosemary"], video: "video", tutorial: "tutor", isBookmarked: false))
                if recipeViewModel.items.isEmpty {
                    Text("kosong")
                } else {
                    ForEach(recipeViewModel.items) { item in
                        RecipeList(item: item)
                        .onTapGesture {
                            withAnimation(.linear){
                                recipeViewModel.addBookmark(item: item)
                            }
                        }
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    NavigationView{
        MainView()
    }.environmentObject(RecipeViewModel())
}
