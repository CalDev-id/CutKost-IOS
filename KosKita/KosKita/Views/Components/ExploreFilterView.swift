//
//  FilterOptionsView.swift
//  CutKost
//
//  Created by Lucky on 02/04/24.
//

import Foundation
import SwiftUI

struct ExploreFilterView: View {
    
    @Binding var highToLowSelected: Bool
    @Binding var lowToHighSelected: Bool
    @Binding  var selectedDuration: Int
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            // Sort by Price
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Text("Filter by Price")
                        .frame(width: 114, height: 21, alignment: .leading)
                        .font(
                          Font.custom("Inter", size: 17)
                            .weight(.bold)
                        )
                        .foregroundColor(Color(red: 0.37, green: 0.37, blue: 0.37))
                }
                .padding(.top, 35).padding(.trailing, 248)
            
                VStack(spacing: 0) {
                    
                    // High To Low
                    HStack(spacing: 0) {
                        Button(action: {
                            highToLowSelected.toggle()
                            lowToHighSelected = false
                        }) {
                            Image(systemName: highToLowSelected ? "circle.inset.filled" : "circle")
                                .foregroundColor(highToLowSelected ? Color(red: 0.97, green: 0.47, blue: 0.18)
                                                 : Color(red: 0.69, green: 0.69, blue: 0.69))
                                .frame(width: 13, height: 13)
                                .padding(.leading, 7).padding(.trailing, 8)
                            
                        }
                        
                        Text("High to Low")
                            .frame(width: 100, height: 16)
                            .font(
                              Font.custom("Inter", size: 13)
                                .weight(.semibold)
                            )
                            .foregroundColor(highToLowSelected ? Color(red: 0.97, green: 0.47, blue: 0.18)
                                             : Color(red: 0.69, green: 0.69, blue: 0.69))
                    }
                    
                    
                    // Low To High
                    HStack(spacing: 0) {
                        Button(action: {
                            lowToHighSelected.toggle()
                            highToLowSelected = false
                        }) {
                            Image(systemName: lowToHighSelected ? "circle.inset.filled" : "circle")
                                .foregroundColor(lowToHighSelected ? Color(red: 0.97, green: 0.47, blue: 0.18)
                                                 : Color(red: 0.69, green: 0.69, blue: 0.69))
                                .frame(width: 13, height: 13)
                                .padding(.leading, 7).padding(.trailing, 8)
                        }
                        
                        Text("Low to High")
                            .frame(width: 100, height: 16)
                            .font(
                              Font.custom("Inter", size: 13)
                                .weight(.semibold)
                            )
                            .foregroundColor(lowToHighSelected ? Color(red: 0.97, green: 0.47, blue: 0.18)
                                             : Color(red: 0.69, green: 0.69, blue: 0.69))
                    }
                    .padding(.top, 12)
                }
                .padding(.top, 17).padding(.trailing, 243)
            }
            .padding(.leading, 30)
            
            
            
            
            
            
            // Sort by Time
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Text("Filter by Price")
                        .frame(width: 114, height: 21, alignment: .leading)
                        .font(
                          Font.custom("Inter", size: 17)
                            .weight(.bold)
                        )
                        .foregroundColor(Color(red: 0.37, green: 0.37, blue: 0.37))
                }
                .padding(.top, 35).padding(.trailing, 248)
            
                HStack(spacing: 0) {
                    
                    // 10 minutes
                    Button(action: {
                        if selectedDuration == 10 {
                            selectedDuration = 0 // Deselect if already selected
                        } else {
                            selectedDuration = 10
                        }
                    }) {
                        ZStack {
                            Rectangle()
                                .foregroundColor(selectedDuration == 10 ? Color(red: 1, green: 0.92, blue: 0.88)
                                                 : Color(red: 0.89, green: 0.89, blue: 0.89))
                                .frame(width: 92, height: 34)
                                .cornerRadius(5)
                            Text("10 Minutes")
                                .font(
                                    Font.custom("Inter", size: 12)
                                        .weight(.medium)
                                )
                                .foregroundColor(selectedDuration == 10 ? Color(red: 0.97, green: 0.47, blue: 0.18)
                                                 : Color(red: 0.69, green: 0.69, blue: 0.69))
                        }
                    }
                    .padding(.trailing, 7)
                    
                    // 30 minutes
                    Button(action: {
                        if selectedDuration == 30 {
                            selectedDuration = 0 // Deselect if already selected
                        } else {
                            selectedDuration = 30
                        }
                    }) {
                        ZStack {
                            Rectangle()
                                .foregroundColor(selectedDuration == 30 ? Color(red: 1, green: 0.92, blue: 0.88)
                                                 : Color(red: 0.89, green: 0.89, blue: 0.89))
                                .frame(width: 92, height: 34)
                                .cornerRadius(5)
                            Text("30 Minutes")
                                .font(
                                    Font.custom("Inter", size: 12)
                                        .weight(.medium)
                                )
                                .foregroundColor(selectedDuration == 30 ? Color(red: 0.97, green: 0.47, blue: 0.18)
                                                 : Color(red: 0.69, green: 0.69, blue: 0.69))
                        }
                    }
                    .padding(.trailing, 7)
                    
                    // 60 minutes
                    Button(action: {
                        if selectedDuration == 60 {
                            selectedDuration = 0 // Deselect if already selected
                        } else {
                            selectedDuration = 60
                        }
                    }) {
                        ZStack {
                            Rectangle()
                                .foregroundColor(selectedDuration == 60 ? Color(red: 1, green: 0.92, blue: 0.88)
                                                 : Color(red: 0.89, green: 0.89, blue: 0.89))
                                .frame(width: 92, height: 34)
                                .cornerRadius(5)
                            Text("60 Minutes")
                                .font(
                                    Font.custom("Inter", size: 12)
                                        .weight(.medium)
                                )
                                .foregroundColor(selectedDuration == 60 ? Color(red: 0.97, green: 0.47, blue: 0.18)
                                                 : Color(red: 0.69, green: 0.69, blue: 0.69))
                        }
                    }
                }
                .padding(.top, 17).padding(.trailing, 71)
            }
            .padding(.leading, 30)
            
            Spacer()
            
        }
    }
}

