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
        ScrollView {
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Text("Saved Deck").padding().background(isBookmark ? .orangeAsset : .orangeLow).foregroundColor(isBookmark ? .white : .secondary).cornerRadius(30).frame(width: 162, height: 34).onTapGesture {
                        isBookmark = true
                    }
                    Text("Saved Recipe").padding().background(isBookmark ? .orangeLow : .orangeAsset).foregroundColor(isBookmark ? .secondary : .white).cornerRadius(30).frame(width: 162, height: 34).onTapGesture {
                        isBookmark = false
                    }
                }
                .frame(width: 337, height: 44)
                .padding(12)
                .background(Color(red: 1, green: 0.92, blue: 0.88))
                .cornerRadius(30)
                .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 4)
            }
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
                        ForEach(deckViewModel.items2) { item in
                            SavedDeckView(item: item)
                                .padding(.bottom, 12)
                                .swipeActions(edge: .trailing) {
                                    Button {
                                        //                                recipeViewModel.addBookmark(item: item)
                                        print("TES")
                                    }label: {
                                        Image(systemName: "trash")
                                    }
                                    .tint(.red)
                                }
                        }
                    }
                }else{
                    ForEach(recipeViewModel.items.filter({$0.isBookmarked})) { item in
                        SavedRecipeView(item: item)
                            .padding(.bottom, 12)
                            .swipeActions(edge: .trailing) {
                                Button {
                                    //                                recipeViewModel.addBookmark(item: item)
                                    print("TES")
                                }label: {
                                    Image(systemName: "trash")
                                }
                                .tint(.red)
                            }
                    }
                    .background(.white)
                    .foregroundColor(.white)
                }
            }
        }
        .padding(.top, 12)
    }
}
