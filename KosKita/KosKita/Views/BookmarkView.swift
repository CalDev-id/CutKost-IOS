//
//  BookmarkView.swift
//  KosKita
//
//  Created by Lucky on 04/04/24.
//

import Foundation
import SwiftUI

struct BookmarkView: View {
    
    @EnvironmentObject var recipeViewModel: RecipeViewModel
    @EnvironmentObject var deckViewModel: DeckViewModel
    
    @State var isBookmark:Bool = true
    
    var body: some View {
        VStack {
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Text("Saved Deck").font(.system(size: 16)).fontWeight(.semibold).padding(.horizontal, 24).padding(.vertical, 8).background(isBookmark ? .orangeAsset : .orangeLow).foregroundColor(isBookmark ? .white : .secondary).cornerRadius(30).onTapGesture {
                        isBookmark = true
                    }
                    Text("Saved Recipe").font(.system(size: 16)).fontWeight(.semibold).padding(.horizontal, 24).padding(.vertical, 8).background(isBookmark ? .orangeLow : .orangeAsset).foregroundColor(isBookmark ? .secondary : .white).cornerRadius(30).onTapGesture {
                        isBookmark = false
                    }
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .padding(.vertical, 8)
                .background(Color(red: 1, green: 0.92, blue: 0.88))
                .cornerRadius(30)
                .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 4)
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 24)

            
            VStack{
                if isBookmark == true {
                    if deckViewModel.items2.isEmpty {
                        Text("No recipe saved!")
                          .font(
                            Font.custom("Inter", size: 20)
                              .weight(.bold)
                          )
                          .multilineTextAlignment(.center)
                          .foregroundColor(Color(red: 0.53, green: 0.53, blue: 0.53))
                          .padding(.bottom, 331)
                    } else {
                        List{
                            ForEach(deckViewModel.items2) { item in
                                SavedDeckView(item: item)
                            }
                            .onDelete(perform: deckViewModel.deleteItem)
                            .onMove(perform: deckViewModel.moveItem)
                        }
                        .listStyle(PlainListStyle())
                    }
                }else{
                    List{
                        ForEach(recipeViewModel.items.filter({$0.isBookmarked})) { item in
                            NavigationLink(destination: DetailView(id: item.id)){
                                SavedRecipeView(item: item)
                            }.foregroundColor(.black)
                        }
                    }
                    .listStyle(PlainListStyle())

                }
            }
        }
        .padding(.top, 12)
    }
}
