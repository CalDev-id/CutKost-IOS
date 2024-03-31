//
//  HomeView.swift
//  KosKita
//
//  Created by Heical Chandra on 31/03/24.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var recipeViewModel: RecipeViewModel
    @EnvironmentObject var deckViewModel: DeckViewModel
    @State var textFieldText: String = ""
    
    @State var item1: Int = 1
    @State var item2: Int = 0
    @State var item3: Int = 0
    
    var body: some View {
        ScrollView{
            VStack{
                HStack{
                    Text("Your daily budget").font(.system(size: 20))
                    Spacer()
                    Text("Press to change >").foregroundColor(.secondary)
                }
                TextField("", text: $textFieldText)
                                    .padding(.horizontal)
                                    .frame(height: 50)
                                    .foregroundColor(.white)
                                    .overlay(
                                        Text("Rp. 0")
                                            .foregroundColor(Color.white) // Ubah warna teks "Rp. 0"
                                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                            .fontWeight(.semibold)
                                            .padding(.leading, 8) // Atur padding jika diperlukan
                                            .opacity(textFieldText.isEmpty ? 1 : 0) // Sembunyikan "Rp. 0" jika ada teks yang dimasukkan
                                            .multilineTextAlignment(.leading).frame(maxWidth: .infinity, alignment: .leading)
                                    )
                                    
            }.padding().background(.secondary.opacity(0.7)).cornerRadius(15)
            PersonalDeck()
            if(textFieldText == ""){
                Text("No data available!").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text("Input your daily budget first").foregroundColor(.secondary)
            }
        }.padding()
    }
}

#Preview {
    NavigationView{
        HomeView()
    }.environmentObject(RecipeViewModel()).environmentObject(DeckViewModel())
}

struct PersonalDeck: View {
    @EnvironmentObject var recipeViewModel: RecipeViewModel
    @EnvironmentObject var deckViewModel: DeckViewModel
    @State var textFieldText: String = ""
    
    @State var item1: Int = 1
    @State var item2: Int = 0
    @State var item3: Int = 0
    
    var body: some View {
        VStack {
            HStack{
                Text("Your personal deck").font(.system(size: 20))
                Spacer()
                
                HStack{
                    Image(systemName: "bookmark")
                    Text("Save")
                }.padding(10).padding(.horizontal).background(.black).foregroundColor(.white).cornerRadius(20).onTapGesture {
                    deckViewModel.addDeck(item1: item1, item2: item2, item3: item3)
                }
            }
            HStack{
                VStack{
                    if item1 == 0 {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 70, height: 70)
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
                            .frame(width: 70, height: 70)
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
                            .frame(width: 70, height: 70)
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
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .padding(.vertical, 8)
            .padding().background(.secondary.opacity(0.7)).cornerRadius(15)
    }
}
