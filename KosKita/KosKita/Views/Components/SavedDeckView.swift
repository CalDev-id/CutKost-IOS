//
//  SavedDeckView.swift
//  KosKita
//
//  Created by Lucky on 04/04/24.
//

import Foundation
import SwiftUI

struct SavedDeckView: View {
    
    @EnvironmentObject var recipeViewModel: RecipeViewModel
    
    let item: DeckModel
    
    var body: some View {
        VStack(spacing: 0) {
            
            HStack(spacing: 0) {
                ZStack {
                    Rectangle()
                      .frame(width: 360, height: 204)
                      .cornerRadius(12)
                      .foregroundColor(Color(red: 1, green: 0.92, blue: 0.88))
                    
                    VStack(spacing: 0) {
                        HStack(spacing: 0) {
                            Text("Your personal deck")
                                .font(
                                    Font.custom("SF Pro", size: 15)
                                        .weight(.bold)
                                )
                            
                            Spacer()
                            
                            Group {
                                HStack(spacing: 0) {
                                    Image(systemName: "bookmark.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 8, height: 12)
                                        .foregroundColor(Color(red: 1, green: 0.92, blue: 0.88))
                                        .padding(.trailing, 2)
                                    
                                    Text("Saved")
                                        .font(Font.custom("SF Pro", size: 10))
                                        .foregroundColor(Color(red: 0.97, green: 0.97, blue: 0.97))
                                        .frame(width: 29, alignment: .topLeading)
                                        .padding(.leading, 2)
                                }
                                .frame(width: 45, height: 12)
                                .padding(4)
                                .background(Color(red: 0.97, green: 0.47, blue: 0.18))
                                .cornerRadius(4)
                            }
                        }
                        .clipped()
                        .frame(alignment: .center)
                        .padding(.horizontal, 33)

                        
                        VStack(spacing: 0) {
                            ZStack {
                                Rectangle()
                                    .fill(
                                        LinearGradient(
                                            gradient: Gradient(stops: [
                                                Gradient.Stop(color: Color(red: 0.97, green: 0.47, blue: 0.18), location: 0.00),
                                                Gradient.Stop(color: Color(red: 1, green: 0.66, blue: 0.47), location: 1.00),
                                            ]),
                                            startPoint: UnitPoint(x: -0.03, y: 0.01),
                                            endPoint: UnitPoint(x: 1.19, y: 1.13)
                                        )
                                    )
                                    .cornerRadius(12)
                                    .frame(width: 344, height: 144)
                                    .padding(12)
                                
                                HStack(spacing: 0){
//                                    ForEach(recipeViewModel.items.filter { $0.id == item.item1 }) { filteredItem in
//                                        VStack{
//                                            URLImageView(url: filteredItem.image)
//                                                .frame(width: 96, height: 120) // Set the desired size
//                                                .clipped() // Clip the image to the frame
//                                                .cornerRadius(12) // Apply corner radius to match the rectangle
//                                        }
//                                        .padding(.leading, 12).padding(.vertical, 12)
//                                    }
                                    
                                    ForEach(Array(zip(recipeViewModel.items.indices, recipeViewModel.items.filter { $0.id == item.item1 })), id: \.1.id) { index, item in
                                        NavigationLink(destination: DetailView(id: item.id)){
                                            VStack{
                                                URLImageView(url: item.image)
                                                    .frame(width: 96, height: 120) // Set the desired size
                                                    .clipped() // Clip the image to the frame
                                                    .cornerRadius(12) // Apply corner radius to match the rectangle
                                            }
                                            .padding(.leading, 12).padding(.vertical, 12)
                                        }.foregroundColor(.black)
                                    }
                                    
                                    ForEach(Array(zip(recipeViewModel.items.indices, recipeViewModel.items.filter { $0.id == item.item2 })), id: \.1.id) { index, item in
                                        NavigationLink(destination: DetailView(id: item.id)){
                                            VStack{
                                                URLImageView(url: item.image)
                                                    .frame(width: 96, height: 120) // Set the desired size
                                                    .clipped() // Clip the image to the frame
                                                    .cornerRadius(12) // Apply corner radius to match the rectangle
                                            }
                                            .padding(.leading, 12).padding(.vertical, 12)
                                        }.foregroundColor(.black)
                                    }
                                    
                                    ForEach(Array(zip(recipeViewModel.items.indices, recipeViewModel.items.filter { $0.id == item.item3 })), id: \.1.id) { index, item in
                                        NavigationLink(destination: DetailView(id: item.id)){
                                            VStack{
                                                URLImageView(url: item.image)
                                                    .frame(width: 96, height: 120) // Set the desired size
                                                    .clipped() // Clip the image to the frame
                                                    .cornerRadius(12) // Apply corner radius to match the rectangle
                                            }
                                            .padding(.leading, 12).padding(.vertical, 12)
                                        }.foregroundColor(.black)
                                    }
                                    
                                }
                            }
                        }
                    }
                }
            }
        }
        .padding(.bottom, 13)
    }
}
