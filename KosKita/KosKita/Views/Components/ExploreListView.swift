//
//  ExploreListView.swift
//  CutKost
//
//  Created by Lucky on 01/04/24.
//

import Foundation
import SwiftUI

struct ExploreListView: View {
    
    let item: RecipeModel
    @EnvironmentObject var recipeViewModel: RecipeViewModel
    
    @State private var isButtonTapped = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 175, height: 216)
                .cornerRadius(12)
                .foregroundColor(.white)
                .shadow(color: .black.opacity(0.3), radius: 2.29185, x: 0, y: 2.75022)
            
            VStack(spacing: 0) {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 175, height: 146)
                    .background(
                        
                        URLImageView(url: item.image)
                    )
                    .cornerRadius(12)
                    .shadow(color: .black.opacity(0.15), radius: 2, x: 0, y: 2)
                
                Spacer()
            }
            
            VStack(spacing: 0) {
                
                Spacer()

                HStack(spacing: 0) {
                    
                    VStack(spacing: 0) {
                        
                        HStack(spacing: 0) {
                            Text(item.title)
                              .font(
                                Font.custom("SF Pro", size: 13)
                                  .weight(.bold)
                              )
                              .foregroundColor(Color(red: 0.05, green: 0.05, blue: 0.05))
                              .frame(width: 113, height: 16, alignment: .leading)
                            
                            Spacer()
                        }
                        .padding(.bottom, 8)
                        .frame(alignment: .leading)
                        
                        HStack(spacing: 0) {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 56, height: 20)
                                    .background(Color(red: 0.97, green: 0.47, blue: 0.18))
                                    .cornerRadius(6)
                                
                                Text("Rp \(item.price)")
                                    .font(
                                      Font.custom("Inter", size: 6.6)
                                        .weight(.semibold)
                                    )
                                    .foregroundColor(Color(red: 0.97, green: 0.97, blue: 0.97))
                                    .frame(width: 50, height: 12, alignment: .center)
                            }
                            .padding(.trailing, 4)
                            
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 46, height: 20)
                                    .background(Color(red: 0.97, green: 0.47, blue: 0.18))
                                    .cornerRadius(6)
                                
                                Text("\(item.time) Menit")
                                    .font(
                                      Font.custom("Inter", size: 6.6)
                                        .weight(.semibold)
                                    )
                                    .foregroundColor(Color(red: 0.97, green: 0.97, blue: 0.97))
                                    .frame(width: 42, height: 12, alignment: .center)
                            }
                            
                            Spacer()
                        }
                    }
                    .frame(width: 139, height: 44, alignment: .leading)
                    .padding(.bottom, 13)
                    
                    VStack(spacing: 0) {
                        CustomButton(buttonName: "bookmark", isTapped: $isButtonTapped) {
                            // Save Bookmark Logic???
                            recipeViewModel.addBookmark(item: item)

                        }
                    }
                    .frame(height: 44, alignment: .top)
                    .padding(.bottom, 10)
                }
                .padding(.horizontal, 6)
            }
        }
    }
}

func CustomButton(buttonName: String, isTapped: Binding<Bool>, action: @escaping () -> Void) -> some View {
    Button(action: {
        // Toggle the state when the button is tapped
        isTapped.wrappedValue.toggle()
        
        // Perform the provided action
        action()
    }) {
        Image(systemName: buttonName)
            .frame(width: 14, height: 18)
            .foregroundColor(isTapped.wrappedValue ? .orangeAsset : .primary) // Change color to orange if tapped
    }
}


