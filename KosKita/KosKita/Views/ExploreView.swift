//
//  ExploreView.swift
//  CutKost
//
//  Created by Lucky on 01/04/24.
//

import Foundation
import SwiftUI

struct ExploreView: View {
    
    @EnvironmentObject var recipeViewModel: RecipeViewModel
//    var recipes: [RecipeViewModel]
    @EnvironmentObject var deckViewModel: DeckViewModel
    
    @State var searchField: String = ""
    //@State var filteredRecipes: [RecipeModel] = []
    
    @State private var isFilterViewPresented = false
    @State private var highToLowSelected = true
    @State private var lowToHighSelected = false
    @State private var selectedDuration: Int = 0
    
//    var filteredRecipes: [RecipeModel] {
//        var filtered = recipes
//
//        // Filter by search field
//        if !searchField.isEmpty {
//            filtered = filtered.filter { $0.title.range(of: searchField, options: .caseInsensitive) != nil }
//        }
//
//        // Filter by duration
//        if selectedDuration != 0 {
//            filtered = filtered.filter { $0.time == selectedDuration }
//        }
//
//        // Sort by price
//        if highToLowSelected {
//            filtered.sort { $0.price >= $1.price }
//        } else if lowToHighSelected {
//            filtered.sort { $0.price <= $1.price }
//        }
//
//        return filtered
//    }
    
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 279, height: 47)
                            .background(.white)
                            .cornerRadius(10)
                            .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
                        
                        HStack(spacing: 0) {
                            Image(systemName: "magnifyingglass")
                                .frame(width: 20, height: 20)
                                .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.69))
                            
                            TextField("Search your own recipe..", text: $searchField)
                                .frame(width: 154, height: 16)
                                .font(
                                    Font.custom("Inter", size: 13)
                                        .weight(.medium)
                                )
                                .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.69))
                        }
                    }
                    .padding(.leading, 16).padding(.trailing, 14)
                    
                    // Filter Button
                    VStack(spacing: 0) {
                        Button(action: {
                            isFilterViewPresented.toggle()
                        }) {
                            Image("FilterIcon")
                                .frame(width: 40, height: 40)
                        }
                        .padding(.trailing, 16)
                    }
                    .sheet(isPresented: $isFilterViewPresented, content: {
                        ExploreFilterView(highToLowSelected: $highToLowSelected, lowToHighSelected: $lowToHighSelected, selectedDuration: $selectedDuration)
                            .presentationDetents([.height(273)])
                            .presentationCornerRadius(30)
                            .presentationDragIndicator(.visible)
                    })
                }
                .padding(.top, 26).padding(.bottom, 32.02)
                
                Spacer()
                
                VStack(spacing: 0) {
//                    LazyVGrid(columns: [GridItem(), GridItem()]) {
//                        ForEach(recipeViewModel.items) { recipe in
//                            ExploreListView(item: recipe)
//                                .padding(.bottom, 20)
//                            //                        }
//                        }
//                        .padding(.horizontal, 16)
//                    }
                    
                    // Search & filter
                    if searchField.isEmpty{
                        LazyVGrid(columns: [GridItem(), GridItem()]) {
                            ForEach(recipeViewModel.items) { recipe in
                                ExploreListView(item: recipe)
                                    .padding(.bottom, 20)
                                //                        }
                            }
                            .padding(.horizontal, 16)
                        }

                    }else{
                        ForEach(recipeViewModel.items.filter({$0.title.lowercased() == searchField.lowercased()})) { item in
                            RecipeList(isDeck: false, item: item)
                        }
                    }
                    
//                    if !filteredRecipes.isEmpty {
//                        VStack(spacing: 0) {
//                            LazyVGrid(columns: [GridItem(), GridItem()]) {
//                                ForEach(recipeViewModel) { recipe in
//                                    ExploreListView(item: recipe)
//                                        .padding(.bottom, 20)
//                                }
//                            }
//                            .padding(.horizontal, 16)
//                        }
//                    } else {
//                        Text("No recipe available!")
//                          .font(
//                            Font.custom("Inter", size: 20)
//                              .weight(.bold)
//                          )
//                          .multilineTextAlignment(.center)
//                          .foregroundColor(Color(red: 0.53, green: 0.53, blue: 0.53))
//                          .padding(.bottom, 331)
//                    }
                }
            }
        }
    }
}
