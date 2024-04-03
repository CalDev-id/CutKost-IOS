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
    @State var isBookmark:Bool = true
    
    var body: some View {
        VStack {
            HStack{
                Text("Saved Deck").padding().background(isBookmark ? .orangeAsset : .orangeLow).foregroundColor(isBookmark ? .white : .secondary).cornerRadius(24).onTapGesture {
                    isBookmark = true
                }
                Text("Saved Recipe").padding().background(isBookmark ? .orangeLow : .orangeAsset).foregroundColor(isBookmark ? .secondary : .white).cornerRadius(24).onTapGesture {
                    isBookmark = false
                }
            }.padding().background(.orangeLow).cornerRadius(40)
            ScrollView {
                VStack{
                    if isBookmark == true {
                        if deckViewModel.items2.isEmpty {
                            Text("kosong")
                        } else {
                            ForEach(deckViewModel.items2) { item in
                                DeckList(deck: item)
                            }
                        }
                    }else{
                        ForEach(recipeViewModel.items.filter({$0.isBookmarked})) { item in
                            RecipeList(isDeck: false, item: item)
                        }
                    }
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
