//
//  CardView.swift
//  TinderUI
//
//  Created by 坂田徳明 on 2023/01/22.
//

import SwiftUI

struct CardView: View {
    @State private var offset = CGSize.zero
    @State private var color: Color = .white
    var url: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(color)
                .frame(width: 320, height: 420)
                .cornerRadius(4)
             
            Image(url)
                .resizable()
                .scaledToFill()
                .frame(width: 320, height: 420)
                .clipped()
        }
        .offset(x: offset.width * 1, y: offset.height * 0.4)
        .rotationEffect(.degrees(Double(offset.width / 40)))
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    offset = gesture.translation
                    withAnimation {
                        changeColor(width: offset.width)
                    }
                }
                .onEnded { _ in
                    withAnimation {
                        swipeCard(width: offset.width)
                        changeColor(width: offset.width)
                    }
                }
        )
    }
    
    func swipeCard(width: CGFloat) {
        switch width {
        case -500...(-150):
            print("\(url) removed")
            offset = CGSize(width: -500, height: 0)
        case 150...500:
            print("\(url) added")
            offset = CGSize(width: 500, height: 0)
        default:
            offset = .zero
        }
    }
    
    func changeColor(width: CGFloat) {
        switch width {
        case -500...(-130):
            color = .red
        case 130...500:
            color = .green
        default:
            color = .white
        }
    }
    
    
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(url: "zoro")
    }
}
