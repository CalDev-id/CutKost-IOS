//
//  DeckList.swift
//  KosKita
//
//  Created by Heical Chandra on 27/03/24.
//

import SwiftUI

struct DeckList: View {
    @EnvironmentObject var recipeViewModel: RecipeViewModel
//    let id:Int
//    let title:String
//    let image:String
//    let ingridients:[String]
//    let video:String
//    let tutorial:String
//    let isBookmarked:Bool
    
//    var item: RecipeModel {
//        RecipeModel(id: id, title: title, image: image, ingridients: ingridients, video: video, tutorial: tutorial, isBookmarked: isBookmarked)
//    }
    
    let deck: DeckModel
    
    var body: some View {
        HStack{
            ForEach(recipeViewModel.items.filter { $0.id == deck.item1 }) { filteredItem in
                VStack{
                    Image(filteredItem.image).resizable().frame(width: 100, height: 100)
                    Text(filteredItem.title)
                }
            }
            ForEach(recipeViewModel.items.filter { $0.id == deck.item2 }) { filteredItem in
                VStack{
                    Image(filteredItem.image).resizable().frame(width: 100, height: 100)
                    Text(filteredItem.title)
                }
            }
            ForEach(recipeViewModel.items.filter { $0.id == deck.item3 }) { filteredItem in
                VStack{
                    Image(filteredItem.image).resizable().frame(width: 100, height: 100)
                    Text(filteredItem.title)
                }
            }
            Spacer()
            Image(systemName: deck.isBookmarked ? "checkmark.circle" : "circle")
                .foregroundColor(deck.isBookmarked ? .green : .red)
        }
        .background(Color.blue.opacity(0.4))
        .font(.title2)
        .padding(.vertical, 8)
        .listRowBackground(Color.green.opacity(0.0))
    }
}

//#Preview {
//    DeckList()
//}
