//
//  DeckViewModel.swift
//  KosKita
//
//  Created by Heical Chandra on 27/03/24.
//

import Foundation

class DeckViewModel: ObservableObject {
    @Published var items2: [DeckModel] = [] {
        didSet {
            saveItem()
        }
    }
    let itemsKey: String = "items_list"
    var hasBeenCalled = false

    init(){
        getItems()
//        if !hasBeenCalled {
//            guard !hasBeenCalled else { return }
//            // Code initialization di sini
//            initRecipe()
//            hasBeenCalled = true
//        }
        
//        initRecipe()

//        if items.isEmpty {
//            initRecipe()
//        }
    }
    
    func initRecipe(){
        let newItems = [
            DeckModel(item1: 1, item2: 1, item3: 1, isBookmarked: false)
        ]
        
        items2.append(contentsOf: newItems)
    }
    
    func getItems(){

        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([DeckModel].self, from: data)
        else {return}
//        guard let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data) else {return}
        
        self.items2 = savedItems
    }

//    func addItem(){
//        let newItem = RecipeModel(title: "Wagyu A5", image: "steak", ingridients: ["daging", "rosemary"], video: "video", tutorial: "tutor", isBookmarked: false)
//        items.append(newItem)
//    }
    func addBookmark(item: DeckModel){
        if let index = items2.firstIndex(where: { $0.id == item.id}) {
            items2[index] = item.BookmarkDeck()
        }
    }
    //new
    func addDeck(item1: Int, item2: Int, item3: Int){
        let newItem = DeckModel(item1: item1, item2: item2, item3: item3, isBookmarked: false)
        items2.append(newItem)
    }
    
    func saveItem(){
        if let encodedData = try? JSONEncoder().encode(items2){
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
    
    

}
