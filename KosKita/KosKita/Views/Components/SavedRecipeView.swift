//
//  SavedRecipeView.swift
//  KosKita
//
//  Created by Lucky on 04/04/24.
//

import Foundation
import SwiftUI


struct SavedRecipeView:View {
    
    let item: RecipeModel
    @EnvironmentObject var recipeViewModel: RecipeViewModel

    
    var body: some View {
        Group {
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    ZStack {
                        Rectangle()
                          .padding(0)
                          .frame(width: 361, alignment: .top)
                          .clipShape(LeftRadius(radius: 12))
                          .foregroundColor(.clear)
                          .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
                        
                        HStack(spacing: 0) {
                            Rectangle()
                              .foregroundColor(.clear)
                              .frame(width: 95, height: 100)
                              .background(
                                URLImageView(url: item.image)
                                  .frame(width: 95, height: 100)
                                  .clipped()
                              )
                              .clipShape(LeftRadius(radius: 12))
                              .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                            
                            VStack(spacing: 0) {
                                
                                HStack(spacing: 0) {
                                    
                                    HStack(spacing: 0){
                                        Text(item.title)
                                            .bold()
                                          .padding(.top, 4)
                                          .foregroundColor(Color(red: 0.05, green: 0.05, blue: 0.05))
                                          .frame(maxWidth: 170, alignment: .leading)
                                        
                                        Spacer()
                                      }
                                    
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
                                    .padding(.top, 8).padding(.trailing, 8)
                                    .onTapGesture {
                                        recipeViewModel.addBookmark(item: item)
                                    }
                                }
                                
                                HStack(spacing: 0) {
                                    Text(item.description)
                                      .font(Font.custom("SF Pro", size: 10))
                                      .padding(.top, 4)
                                      .foregroundColor(Color(red: 0.53, green: 0.53, blue: 0.53))
                                      .frame(maxWidth: 170, alignment: .leading)
                                    
                                    Spacer()
                                }
                                
                                Spacer()
                            }
                            .padding(.leading, 8)
                        }
                    }
                }
                
                
            }
            .frame(width: 361, height: 100)
            .padding(.horizontal, 0)
            .padding(.vertical, 4)
            .frame(width: 361, alignment: .topLeading)
        }
    }
}
