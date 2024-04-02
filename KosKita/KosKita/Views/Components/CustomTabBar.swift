//
//  CustomTabBar.swift
//  WeebsXD
//
//  Created by Heical Chandra on 15/03/24.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case house
    case magnifyingglass
    case bookmark
}

struct CustomTabBar: View {
    @Binding var selectedTab: Tab
    private var fillImage: String {
        selectedTab.rawValue + ".fill"
    }
    private var tabColor: Color {
        switch selectedTab {
        case .house:
            return .white
        case .magnifyingglass:
            return .white
        case .bookmark:
            return .white
        }
    }
    
    private var tabName: String {
        switch selectedTab {
        case .house:
            return "Home"
        case .magnifyingglass:
            return "Discover"
        case .bookmark:
            return "Bookmark"
        }
    }
    
    private var tabImage: String {
        switch selectedTab {
        case .house:
            return "home"
        case .magnifyingglass:
            return "lib"
        case .bookmark:
            return "saveoff"
        }
    }
    
    private var tabImageOff: String {
        switch selectedTab {
        case .house:
            return "homeoff"
        case .magnifyingglass:
            return "liboff"
        case .bookmark:
            return "saveoff"
        }
    }

    var body: some View {
        VStack {
            HStack {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Spacer()
                    HStack{
                        Image(systemName: selectedTab == tab ? fillImage : tab.rawValue)
                            .scaleEffect(tab == selectedTab ? 1.25 : 1.0)
                            .foregroundColor(tab == selectedTab ? tabColor : .gray)
                            .font(.system(size: 20))
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 0.1)) {
                                    selectedTab = tab
                                }
                            }
                        if (selectedTab == tab){
                            Text(tabName).foregroundColor(.white).bold()
                        }
                    }.padding(10).background(selectedTab == tab ? .orangeAsset : .clear).cornerRadius(8)
                    Spacer()
                }
            }
            .frame(width: nil, height: 60)
            .background(.white)
            .cornerRadius(20)
            .padding()
        }
    
    }
}

#Preview {
    CustomTabBar(selectedTab: .constant(.house)).background(.blue)
}
