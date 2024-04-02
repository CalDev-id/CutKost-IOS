//
//  RecipeList.swift
//  KosKita
//
//  Created by Heical Chandra on 24/03/24.
//

import SwiftUI

struct RecipeList: View {
    var isDeck:Bool

    let item: RecipeModel
    
    var body: some View {
        VStack{
            URLImageView(url: item.image).frame(width: 168, height: 110).cornerRadius(20)
            HStack{
                VStack(alignment: .leading){
                    HStack {
                        Text(item.title).font(.system(size: 18)).bold()
                        Image(systemName: item.isDeck ? "checkmark.circle.fill" : "checkmark.circle")
                            .foregroundColor(item.isDeck ? .orangeAsset : .orangeAsset)
                    }
                    HStack{
                        Text("Rp. \(item.price)").font(.system(size: 10)).foregroundColor(.white).padding(5).fontWeight(.semibold).background(.orangeAsset).cornerRadius(8)
                        Text("\(String(item.time)) Menit").font(.system(size: 10)).foregroundColor(.orangeAsset)
                    }
                }
            }.padding(.horizontal, 10).padding(.bottom, 10)
        }
        .font(.title2)
        .background(.white)
        .cornerRadius(20)
    }
}

#Preview {
    RecipeList(isDeck: false, item: RecipeModel(id: 1, title: "Nasi Goreng Ayam", description: "Nasi goreng ayam dengan cita rasa khas Indonesia.", image: "https://drive.google.com/uc?export=download&id=16gZoP8XjCSAx2M-l7hT3JJon9Cvgp5wL", price: 15000, time: 10, ingredients: ["Nasi putih", "Daging ayam", "Bawang merah", "Bawang putih", "Kecap manis", "Telur", "Minyak goreng"] , video: "https://www.youtube.com/watch?v=1t75_f8DUJE", step: ["Tumis bawang merah dan bawang putih hingga harum.", "Masukkan daging ayam yang telah dipotong kecil, aduk hingga matang.", "Tambahkan nasi putih dan kecap manis, aduk rata.", "Buat telur mata sapi di sisi wajan yang berbeda.", "Campur telur dengan nasi goreng, aduk rata hingga matang.", "Sajikan nasi goreng ayam hangat."] , isBookmarked: false, isDeck: false))
}

