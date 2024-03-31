//
//  MainView.swift
//  KosKita
//
//  Created by Heical Chandra on 24/03/24.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var recipeViewModel: RecipeViewModel
    @EnvironmentObject var deckViewModel: DeckViewModel
    @State var textFieldText: String = ""
    
    @State var item1: Int = 0
    @State var item2: Int = 0
    @State var item3: Int = 0

    var body: some View {
        ScrollView {
            VStack {
    //            RecipeList(item: RecipeModel(title: "Wagyu A5", image: "steak", ingridients: ["daging", "rosemary"], video: "video", tutorial: "tutor", isBookmarked: false))
                Text(textFieldText)
                TextField("Search here...", text: $textFieldText)
                                    .padding(.horizontal)
                                    .frame(height: 50)
                                    .foregroundColor(.black)
                                    .background(Color.white)
                                    .cornerRadius(15).shadow(radius: 0.7).padding(.horizontal, 13)
                Text("search").padding(8).background(.black).foregroundColor(.white).cornerRadius(20)
                if textFieldText.isEmpty{
                    Text("search kosong")
                }else{
                    ForEach(recipeViewModel.items.filter({$0.title.lowercased() == textFieldText.lowercased()})) { item in
                        RecipeList(item: item)
                    }
                }
                Text("deck").padding(8).background(.black).foregroundColor(.white).cornerRadius(20)
                //dummy deck
                HStack{
                    VStack{
                        if item1 == 0 {
                            Image(systemName: "plus")
                                .resizable()
                                .frame(width: 100, height: 100)
                        } else {
                            ForEach(recipeViewModel.items.filter { $0.id == item1 }) { filteredItem in
                                VStack {
                                    Image(filteredItem.image)
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                    Text(filteredItem.title)
                                }
                            }
                        }
                    }
                    VStack{
                        if item2 == 0 {
                            Image(systemName: "plus")
                                .resizable()
                                .frame(width: 100, height: 100)
                        } else {
                            ForEach(recipeViewModel.items.filter { $0.id == item2 }) { filteredItem in
                                VStack {
                                    Image(filteredItem.image)
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                    Text(filteredItem.title)
                                }
                            }
                        }
                    }
                    VStack{
                        if item3 == 0 {
                            Image(systemName: "plus")
                                .resizable()
                                .frame(width: 100, height: 100)
                        } else {
                            ForEach(recipeViewModel.items.filter { $0.id == item3 }) { filteredItem in
                                VStack {
                                    Image(filteredItem.image)
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                    Text(filteredItem.title)
                                }
                            }
                        }
                    }
                }
                .background(Color.blue.opacity(0.4))
                .font(.title2)
                .padding(.vertical, 8)
                .listRowBackground(Color.green.opacity(0.0))
                //end dummy
//                if let lastItem = deckViewModel.items.last {
//                    DeckList(deck: lastItem)
//                        .padding()
//                } else {
//                    Text("kosong")
//                }
                Button(action: {
                    deckViewModel.addDeck(item1: item1, item2: item2, item3: item3)
                }) {
                    Text("Save Deck")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
                Text("daftar menu").padding(8).background(.black).foregroundColor(.white).cornerRadius(20)
                if recipeViewModel.items.isEmpty {
                    Text("kosong")
                } else {
                    ForEach(recipeViewModel.items) { item in
                        RecipeList(item: item)
                        .onTapGesture {
                            withAnimation(.linear){
                                recipeViewModel.addBookmark(item: item)
                                if item1 == 0 {
                                    item1 = item.id
                                }
                                else if item2 == 0 {
                                    item2 = item.id
                                }
                                else if item3 == 0 {
                                    item3 = item.id
                                }
                            }
                        }
                    }
//                    if let firstItem = recipeViewModel.items.first {
//                        RecipeList(item: firstItem)
//                            .padding()
//                    } else {
//                        Text("kosong")
//                    }
//                    if recipeViewModel.items.count >= 3 {
//                        let thirdItem = recipeViewModel.items[1]
//                        RecipeList(item: thirdItem)
//                            .padding()
//                    } else {
//                        Text("kosong")
//                    }
                }
                Text("Bookmark").padding(8).background(.black).foregroundColor(.white).cornerRadius(20)
                if (recipeViewModel.items.filter({$0.isBookmarked}).isEmpty){
                    Text("bookmark kosong")
                }
                ForEach(recipeViewModel.items.filter({$0.isBookmarked})) { item in
                    RecipeList(item: item)
                }
                Text("daftar deck").padding(8).background(.black).foregroundColor(.white).cornerRadius(20)
                if recipeViewModel.items.isEmpty {
                    Text("kosong")
                } else {
                    ForEach(deckViewModel.items) { item in
                        DeckList(deck: item)
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
    }.environmentObject(RecipeViewModel()).environmentObject(DeckViewModel())
}
