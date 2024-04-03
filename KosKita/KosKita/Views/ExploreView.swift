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
    @EnvironmentObject var deckViewModel: DeckViewModel
    
    @State var searchField: String = ""
    
    @State private var isFilterViewPresented = false
    @State private var highToLowSelected = true
    @State private var lowToHighSelected = false
    @State private var selectedDuration: Int = 0
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 317, height: 40)
                            .background(.white)
                            .cornerRadius(12)
                            .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
                        
                        HStack(spacing: 0) {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.69))
                                .padding(.leading, 24).padding(.trailing, 4).padding(.vertical, 12)
                            
                            
                            TextField("Search your own recipe..", text: $searchField)
                                .font(
                                    Font.custom("Inter", size: 13)
                                        .weight(.medium)
                                )
                                .foregroundColor(Color(red: 0.69, green: 0.69, blue: 0.69))
                                .padding(.trailing, 12).padding(.vertical, 12)
                        }
                        //.padding(.vertical, 12).padding(.horizontal, 12)
                    }
                    
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
                
                Spacer()
                
                if !searchField.isEmpty {

                    let filteredRecipes = recipeViewModel.items.filter { recipe in
                        return recipe.title.range(of: searchField, options: .caseInsensitive) != nil
                    }

                    if !filteredRecipes.isEmpty {
                        VStack(spacing: 0) {
                            LazyVGrid(columns: [GridItem(), GridItem()]) {
                                ForEach(Array(zip(filteredRecipes.indices, filteredRecipes)), id: \.1.id) { index, item in
                                    NavigationLink(destination: DetailView(id: item.id)){
                                        ExploreListView(item: item)
                                            .padding(.bottom, 20)
                                            .padding(.top, index < 2 ? 27 : 0)
                                            .padding(.leading, index % 2 == 0 ? 16 : 4) // Add left padding to items in the left column
                                            .padding(.trailing, index % 2 != 0 ? 16 : 4) // Add right padding to items in the right column
                                    }.foregroundColor(.black)
                                }
                            }
                        }

                    } else {
                        Text("Recipe not available")
                          .font(
                            Font.custom("Inter", size: 20)
                              .weight(.bold)
                          )
                          .multilineTextAlignment(.center)
                          .foregroundColor(Color(red: 0.53, green: 0.53, blue: 0.53))
                          .padding(.bottom, 331)
                    }

                } else {
                    VStack(spacing: 0){
                        LazyVGrid(columns: [GridItem(), GridItem()]) {
                            ForEach(Array(zip(recipeViewModel.items.indices, recipeViewModel.items)), id: \.1.id) { index, item in
                                NavigationLink(destination: DetailView(id: item.id)){
                                    ExploreListView(item: item)
                                        .padding(.bottom, 20)
                                        .padding(.top, index < 2 ? 27 : 0)
                                        .padding(.leading, index % 2 == 0 ? 16 : 4) // Add left padding to items in the left column
                                        .padding(.trailing, index % 2 != 0 ? 16 : 4) // Add right padding to items in the right column
                                }.foregroundColor(.black)
                            }
                        }
                    }
                }
            }
        }
        .padding(.top, 12)
    }
}
