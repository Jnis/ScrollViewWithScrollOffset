//
//  ContentView.swift
//  Examples
//
//  Created by Yanis Plumit on 11.11.2022.
//

import SwiftUI
import ScrollViewWithScrollOffset

struct ContentView: View {
    @State var scrollOffset: CGFloat = 0
    
    var body: some View {
        ScrollViewWithScrollOffset(scrollOffset: $scrollOffset, content: {
            VStack {
                image
                Color.gray.frame(height: 1000)
            }
        })
    }
    
    var image: some View {
        GeometryReader { proxy in
            Image(systemName: "heart.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, min(0, -scrollOffset))
                .frame(width: proxy.size.width,
                       height: proxy.size.height + max(0, scrollOffset))
                .offset(CGSize(width: 0, height: min(0, -scrollOffset)))
        }
        .aspectRatio(CGSize(width: 375, height: 280), contentMode: .fit)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
