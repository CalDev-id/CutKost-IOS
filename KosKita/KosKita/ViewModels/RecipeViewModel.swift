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
            RecipeModel(id: 1, title: "Nasi Goreng Ayam", description: "Nasi goreng ayam dengan cita rasa khas Indonesia.", image: "https://drive.google.com/uc?export=download&id=16gZoP8XjCSAx2M-l7hT3JJon9Cvgp5wL", price: 15000, time: "10 menit", ingredients: ["Nasi putih", "Daging ayam", "Bawang merah", "Bawang putih", "Kecap manis", "Telur", "Minyak goreng"] , video: "https://www.youtube.com/watch?v=1t75_f8DUJE", step: ["Tumis bawang merah dan bawang putih hingga harum.", "Masukkan daging ayam yang telah dipotong kecil, aduk hingga matang.", "Tambahkan nasi putih dan kecap manis, aduk rata.", "Buat telur mata sapi di sisi wajan yang berbeda.", "Campur telur dengan nasi goreng, aduk rata hingga matang.", "Sajikan nasi goreng ayam hangat."] , isBookmarked: false),
            RecipeModel(id: 2, title: "Mie Goreng Sayuran", description: "Mie goreng dengan campuran sayuran segar.", image: "https://drive.google.com/uc?export=download&id=160_wRmJuT1jz-YLRBqAzQlugW2cX43Fv", price: 12000, time: "15 menit", ingredients: ["Mie instan", "Wortel", "Kubis", "Bawang merah", "Bawang putih", "Kecap manis", "Minyak goreng"] , video: "https://youtu.be/E3VflxR5_hI?si=eIcUgTB8d5mMn5RF", step: ["Rebus mie instan hingga matang, tiriskan.", "Tumis bawang merah dan bawang putih hingga harum.", "Masukkan sayuran, aduk hingga layu.", "Tambahkan mie instan dan kecap manis, aduk rata.", "Sajikan mie goreng sayuran hangat."] , isBookmarked: false),
            RecipeModel(id: 3, title: "Telur Dadar" , description: "Telur dadar sederhana namun lezat." , image: "https://drive.google.com/uc?export=download&id=1xmGIZllXPnHX2QsCC8gqNlrGhqBBeknN", price: 8000, time: "5 menit", ingredients: ["Telur", "Bawang merah", "Bawang putih", "Garam", "Minyak goreng"] , video: "https://youtu.be/cIbaMvN6sUk?si=ugN0m7z5ExDp256B", step: ["Kocok telur dalam sebuah mangkuk.", "Tambahkan bawang merah, bawang putih, dan garam, aduk rata.", "Panaskan minyak goreng di wajan.", "Tuangkan adonan telur ke wajan panas, biarkan hingga matang di kedua sisi.", "Sajikan telur dadar hangat."] , isBookmarked: false)
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
