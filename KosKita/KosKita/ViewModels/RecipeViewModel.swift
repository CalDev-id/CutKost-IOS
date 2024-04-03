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
    let itemsKey: String = "items_list2"
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
            RecipeModel(id: 1, title: "Nasi Goreng Ayam", description: "Nasi goreng ayam dengan cita rasa khas Indonesia.", image: "https://drive.google.com/uc?export=download&id=16gZoP8XjCSAx2M-l7hT3JJon9Cvgp5wL", price: 15000, time: 10, ingredients: ["Nasi putih", "Daging ayam", "Bawang merah", "Bawang putih", "Kecap manis", "Telur", "Minyak goreng"] , video: "1t75_f8DUJE", step: ["Tumis bawang merah dan bawang putih hingga harum.", "Masukkan daging ayam yang telah dipotong kecil, aduk hingga matang.", "Tambahkan nasi putih dan kecap manis, aduk rata.", "Buat telur mata sapi di sisi wajan yang berbeda.", "Campur telur dengan nasi goreng, aduk rata hingga matang.", "Sajikan nasi goreng ayam hangat."] , isBookmarked: false, isDeck: false),
            RecipeModel(id: 2, title: "Mie Goreng Sayuran", description: "Mie goreng dengan campuran sayuran segar.", image: "https://drive.google.com/uc?export=download&id=160_wRmJuT1jz-YLRBqAzQlugW2cX43Fv", price: 12000, time: 15, ingredients: ["Mie instan", "Wortel", "Kubis", "Bawang merah", "Bawang putih", "Kecap manis", "Minyak goreng"] , video: "Kn2lcf1d31g", step: ["Rebus mie instan hingga matang, tiriskan.", "Tumis bawang merah dan bawang putih hingga harum.", "Masukkan sayuran, aduk hingga layu.", "Tambahkan mie instan dan kecap manis, aduk rata.", "Sajikan mie goreng sayuran hangat."] , isBookmarked: false, isDeck: false),
            RecipeModel(id: 3, title: "Telur Dadar" , description: "Telur dadar sederhana namun lezat." , image: "https://drive.google.com/uc?export=download&id=1xmGIZllXPnHX2QsCC8gqNlrGhqBBeknN", price: 8000, time: 5, ingredients: ["Telur", "Bawang merah", "Bawang putih", "Garam", "Minyak goreng"] , video: "cIbaMvN6sUk", step: ["Kocok telur dalam sebuah mangkuk.", "Tambahkan bawang merah, bawang putih, dan garam, aduk rata.", "Panaskan minyak goreng di wajan.", "Tuangkan adonan telur ke wajan panas, biarkan hingga matang di kedua sisi.", "Sajikan telur dadar hangat."] , isBookmarked: false, isDeck: false),
            RecipeModel(id: 4, title: "Sayur Bayam" , description: "Sayur bening bayam yang segar dan bergizi.", image: "https://drive.google.com/uc?export=download&id=1N7Nucn4pZ2adsLZr6UetzT8TOXHx3EJF", price: 10000 , time: 5, ingredients: ["Bayam", "Wortel", "Tomat", "Bawang putih", "Garam", "Gula", "Minyak goreng"] , video: "6hlNjngay2k", step: ["Tumis bawang putih hingga harum.", "Tambahkan wortel dan tomat, aduk hingga layu.", "Masukkan bayam, aduk hingga layu.", "Tambahkan air, garam, dan gula, biarkan mendidih.", "Sajikan sayur bening bayam hangat."] , isBookmarked: false, isDeck: false),
            RecipeModel(id: 5, title: "Tumis Kangkung", description: "Tumis kangkung dengan bumbu yang khas.", image: "https://drive.google.com/uc?export=download&id=1xWX2VCyKPzZbaJuq69YnrUBHoPYn77YV", price: 9000, time: 5, ingredients: ["Kangkung", "Bawang merah", "Bawang putih", "Cabe rawit", "Garam", "Minyak goreng"], video: "hevXi1zbKgI", step: ["Tumis bawang merah dan bawang putih hingga harum.", "Masukkan cabe rawit, aduk sebentar.", "Tambahkan kangkung, aduk hingga layu.", "Tambahkan garam secukupnya, aduk rata.", "Sajikan tumis kangkung hangat."], isBookmarked: false, isDeck: false),
            RecipeModel(id: 6, title:  "Capcay Sayuran" , description:  "Capcay sayuran dengan variasi yang segar.", image: "https://drive.google.com/uc?export=download&id=1SyWa1_Fq2C5dD_Aofj9rlDd3sOmWVg_b", price: 20000, time: 10, ingredients:  ["Wortel", "Kembang kol", "Buncis", "Jamur", "Saus tiram", "Minyak goreng"] , video: "YxMqHgQxsW0", step: ["Potong semua sayuran sesuai selera.", "Tumis semua sayuran hingga setengah matang.", "Tambahkan saus tiram, aduk rata.", "Masak hingga sayuran matang.", "Sajikan capcay sayuran hangat."] , isBookmarked: false, isDeck: false),
            RecipeModel(id: 7, title: "Omelet Sosis", description: "Omelet dengan tambahan sosis yang nikmat.", image: "https://drive.google.com/uc?export=download&id=1wxJ-baG349UOtogeRFNWr3gaIkKxjzli", price: 15000, time: 5, ingredients: ["Telur", "Sosis", "Bawang merah", "Bawang putih", "Garam", "Merica", "Minyak goreng"] , video: "LrzLVsw-eZk", step:  ["Kocok telur dalam sebuah mangkuk.", "Tambahkan sosis yang telah dipotong kecil dan bumbu-bumbu lainnya, aduk rata.", "Panaskan minyak goreng di wajan."], isBookmarked: false, isDeck: false),
            RecipeModel(id: 8, title: "Tumis Tahu Tempe", description: "Tumisan sederhana dari tahu dan tempe yang lezat.", image: "https://drive.google.com/uc?export=download&id=1l39EvSVh5fQAMoQvbNTzbnlCCN7CloiE", price: 12000, time: 15, ingredients: ["Tahu", "Tempe", "Bawang merah", "Bawang putih", "Kecap manis", "Garam", "Minyak goreng"] , video: "PBUtVQ_Z4d4", step: ["Potong tahu dan tempe menjadi dadu.", "Tumis bawang merah dan bawang putih hingga harum.", "Masukkan tahu dan tempe, aduk hingga matang.", "Tambahkan kecap manis dan garam secukupnya, aduk rata.", "Sajikan tumis tahu tempe hangat."] , isBookmarked: false, isDeck: false),
            RecipeModel(id: 9, title: "Ayam Goreng Tepung" , description: "Ayam goreng dengan balutan tepung yang renyah.", image: "https://drive.google.com/uc?export=download&id=1jJa7AVQ8OCWKuQPzDqot3pVcZrV4qn1I", price: 30000, time: 25, ingredients: ["Daging ayam", "Tepung terigu", "Telur", "Bawang putih", "Garam", "Merica", "Minyak goreng"] , video: "j9a9EB0pGTo", step:  ["Potong daging ayam sesuai selera.", "Campur tepung terigu dengan bawang putih, garam, dan merica.", "Celupkan potongan ayam ke dalam telur kocok, lalu gulingkan dalam campuran tepung.", "Goreng ayam dalam minyak panas hingga kuning keemasan.", "Tiriskan dan sajikan ayam goreng tepung panas."] , isBookmarked: false, isDeck: false),
            RecipeModel(id: 10, title: "Nasi Goreng Seafood", description: "Nasi goreng dengan campuran seafood segar.", image: "https://drive.google.com/uc?export=download&id=1KPmXKlipVjf2KPYnIZeXN9HUsWP29QNz", price: 30000, time: 35, ingredients:  ["Nasi putih", "Udang", "Cumi-cumi", "Kepiting", "Bawang merah", "Bawang putih", "Kecap manis", "Telur", "Minyak goreng"] , video: "Js9FXCkn798", step: ["Tumis bawang merah dan bawang putih hingga harum.", "Masukkan udang, cumi-cumi, dan kepiting, aduk hingga matang.", "Tambahkan nasi putih dan kecap manis, aduk rata.", "Buat telur mata sapi di sisi wajan yang berbeda.", "Campur telur dengan nasi goreng, aduk rata hingga matang.", "Sajikan nasi goreng seafood hangat."] , isBookmarked: false, isDeck: false)
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
    func addDeck(item: RecipeModel){
        if let index = items.firstIndex(where: { $0.id == item.id}) {
            items[index] = item.addDeck()
        }
    }
    func delDeck(item: RecipeModel){
        if let index = items.firstIndex(where: { $0.id == item.id}) {
            items[index] = item.delDeck()
        }
    }
}
