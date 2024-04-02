//
//  ContentView.swift
//  KosKita
//
//  Created by Heical Chandra on 02/04/24.
//

import SwiftUI

struct ContentView: View {
    @State private var tabSelected: Tab = .house
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack {
                  VStack {
                      TabView(selection: $tabSelected) {
                          ForEach(Tab.allCases, id: \.self) { tab in
                              getView(for: tab)
                                  .tag(tab)
                          }
                      }
                  }
                  VStack {
                      Spacer()
                      CustomTabBar(selectedTab: $tabSelected).shadow(radius: 3)
                  }
              }.navigationBarBackButtonHidden(true)
          }
          
          func getView(for tab: Tab) -> some View {
              switch tab {
              case .house:
                  return AnyView(HomeView())
              case .magnifyingglass:
                  return AnyView(OnboardView())
              case .bookmark:
                  return AnyView(bookmarkDummy())
              }
          }
      }

#Preview {
    ContentView().previewInterfaceOrientation(.portrait)
}
