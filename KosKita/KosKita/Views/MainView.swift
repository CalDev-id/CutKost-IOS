//
//  MainView.swift
//  KosKita
//
//  Created by Heical Chandra on 24/03/24.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var recipeViewModel: RecipeViewModel
    @State var textFieldText: String = ""

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
                Text("daftar menu").padding(8).background(.black).foregroundColor(.white).cornerRadius(20)
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
