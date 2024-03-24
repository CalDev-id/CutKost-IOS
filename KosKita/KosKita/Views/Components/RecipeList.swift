//
//  RecipeList.swift
//  KosKita
//
//  Created by Heical Chandra on 24/03/24.
//

import SwiftUI

struct RecipeList: View {
    let item: RecipeModel
    
    var body: some View {
        HStack{
            Image(item.image).resizable().frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
            Text(item.title)
            Spacer()
            Image(systemName: item.isBookmarked ? "checkmark.circle" : "circle")
                .foregroundColor(item.isBookmarked ? .green : .red)
        }
        .font(.title2)
        .padding(.vertical, 8)
        .background(Color.red.opacity(0.0))
        .listRowBackground(Color.green.opacity(0.0))
    }
}

#Preview {
    RecipeList(item: RecipeModel(title: "Wagyu A5", image: "steak", ingridients: ["daging", "rosemary"], video: "video", tutorial: "tutor", isBookmarked: false))
}
