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
                Image("onboard").resizable().aspectRatio(contentMode: .fit)
                Spacer()
            }
            
            VStack{
                Text("Skip")
                    .padding(.trailing, 40)
                    .multilineTextAlignment(.trailing).frame(maxWidth: .infinity, alignment: .trailing).foregroundColor(.orange)
                Image("meetOnboard").resizable().frame(width: 300,height: 300)
                Text("Find menu based on").bold().font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Text("Your budget!").bold().font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Text("loremmmmmmmmmmmmmmmm")
                Text("ipsummmmmmmmmmm")
                
                Text("-----").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
                NavigationLink(destination: HomeView()){
                    Text("Next").padding(.horizontal, 50).padding(.vertical, 7).foregroundColor(.orange).fontWeight(.semibold)
                        .background(
                            .white
                        ).cornerRadius(20)
                }.padding(.top, 100)
            }.foregroundColor(.white)
        }.edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    OnboardView()
}
