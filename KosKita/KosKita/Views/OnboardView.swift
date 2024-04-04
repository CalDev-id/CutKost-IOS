//
//  OnboardView.swift
//  KosKita
//
//  Created by Heical Chandra on 31/03/24.
//

import SwiftUI

struct OnboardView: View {
    var body: some View {
        ZStack{
            VStack{
                Image("bgSplash2").resizable().aspectRatio(contentMode: .fill).padding(.top, 2)
                Spacer()
            }
            
            VStack{
                Image("meet3").resizable().frame(width: 300,height: 300).padding(.top, 30)
                Text("Find menu based on").bold().font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Text("Your budget!").bold().font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Text("Minimize your expenses and still eat")
                Text("deliciously every day")
                
                NavigationLink(destination: ContentView()){
                    Text("Get Started").padding(.horizontal, 50).padding(.vertical, 7).foregroundColor(.orangeAsset).fontWeight(.semibold)
                        .background(
                            .white
                        ).cornerRadius(20)
                }.padding(.top, 150)
            }.foregroundColor(.white)
        }.edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    OnboardView()
}
