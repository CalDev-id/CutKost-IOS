//
//  RecipeViewModel.swift
//  KosKita
//
//  Created by Heical Chandra on 24/03/24.
//

import Foundation

//objek khusus yang diakses secara global (RecipeModel)
class RecipeViewModel: ObservableObject {
    @Published var items: [RecipeModel] = [] {
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
        if items.isEmpty {
            initRecipe()
        }
    }
    
    func initRecipe(){
        let newItems = [
            RecipeModel(id: 1, title: "wagyu", image: "steak", ingridients: ["daging", "rosemary"], video: "video", tutorial: "tutor", isBookmarked: false),
            RecipeModel(id: 2, title: "nasi goreng", image: "nasi", ingridients: ["daging", "rosemary"], video: "video", tutorial: "tutor", isBookmarked: false),
            RecipeModel(id: 3, title: "ayam goreng", image: "ayam", ingridients: ["daging", "rosemary"], video: "video", tutorial: "tutor", isBookmarked: false)
        ]
        
        items.append(contentsOf: newItems)
    }
    
    func getItems(){

        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([RecipeModel].self, from: data)
        else {return}
//        guard let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data) else {return}
        
        self.items = savedItems
    }

//    func addItem(){
//        let newItem = RecipeModel(title: "Wagyu A5", image: "steak", ingridients: ["daging", "rosemary"], video: "video", tutorial: "tutor", isBookmarked: false)
//        items.append(newItem)
//    }
    func addBookmark(item: RecipeModel){
        if let index = items.firstIndex(where: { $0.id == item.id}) {
            items[index] = item.addBookmark()
        }
    }
    func saveItem(){
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
