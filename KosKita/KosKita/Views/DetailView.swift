//
//  DetailView.swift
//  KosKita
//
//  Created by Heical Chandra on 03/04/24.
//

import SwiftUI

struct DetailView: View {
    let id:Int
    @EnvironmentObject var recipeViewModel: RecipeViewModel
    @State var ingredientsCheck:Bool = false
    
    var body: some View {
        ScrollView{
            ForEach(recipeViewModel.items.filter { $0.id == id }) { filteredItem in
                VStack {
//                    URLImageView(url: filteredItem.image).frame(width: 105, height: 125).cornerRadius(20)
                    URLYoutubeView(ID: filteredItem.video)
                    VStack(alignment: .leading){
                        HStack{
                            Text(filteredItem.title)
                                .font(.title)
                                .fontWeight(.bold)
                            Spacer()
                            if(filteredItem.isBookmarked){
                                Image("bookmark1")
                            }else{
                                Image("bookmark0")
                            }
                        }
                        HStack{
                            Text("Rp. \(filteredItem.price)").padding(7).background(.orangeAsset).foregroundColor(.white).fontWeight(.semibold).cornerRadius(10)
                            Text("\(filteredItem.time) Menit").padding(7).background(.orangeAsset).foregroundColor(.white).fontWeight(.semibold).cornerRadius(10)
                        }
                        Text(filteredItem.description).foregroundColor(.secondary).padding(.bottom, 15)
                        Text("Bahan Bahan").bold().font(.system(size: 20)).opacity(0.7)
                        ForEach(filteredItem.ingredients, id: \.self) { ingredient in
                            HStack {
                                if(ingredientsCheck){
                                    Image(systemName: "checkmark.circle.fill").foregroundColor(.orangeAsset)
                                }else{
                                    Image(systemName: "checkmark.circle").foregroundColor(.orangeAsset)
                                }
                                Text(ingredient)
                                    .padding(.vertical, 5)
                                Spacer()
                                Text("250 gram")
                            }.padding().background(.thinMaterial).cornerRadius(20).onTapGesture{
                                ingredientsCheck = true
                            }
                        }
                        Text("Bahan Bahan").bold().font(.system(size: 20)).opacity(0.7)
                        ForEach(Array(filteredItem.step.enumerated()), id: \.offset) { index, step in
                            HStack {
                                Text("\(index + 1)")
                                Text(step)
                            }
                            .padding()
                            .foregroundColor(.secondary)
                        }

                    }.padding(.horizontal, 22)
                }
            }
        }
    }
}

#Preview {
    NavigationView{
        DetailView(id: 2)
    }.environmentObject(RecipeViewModel()).environmentObject(DeckViewModel())
}

struct IngredientRow: View {
    var ingredientName: String
    var dosageInfo: String

    var body: some View {
        HStack {
            Text(ingredientName)
            Spacer()
            Text(dosageInfo)
                .foregroundColor(.gray)
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
    }
}
