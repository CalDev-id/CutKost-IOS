//
//  URLYoutubeView.swift
//  KosKita
//
//  Created by Heical Chandra on 03/04/24.
//

import SwiftUI
import WebKit

struct URLYoutubeView: View {
    let ID: String
    
    var body: some View {
        Video(videoID: ID).frame(width: 361, height: 195).cornerRadius(18).padding(.horizontal, 24)
            .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
    }
}

struct Video: UIViewRepresentable{
    
    let videoID: String
    
    func makeUIView(context: Context) -> some WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        guard let YoutubeURL = URL(string: "https://www.youtube.com/embed/\(videoID)") else{return}
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: YoutubeURL))
    }
}

#Preview {
    URLYoutubeView(ID: "")
}
