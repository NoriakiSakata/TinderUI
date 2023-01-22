//
//  ContentView.swift
//  TinderUI
//
//  Created by 坂田徳明 on 2023/01/22.
//

import SwiftUI

struct ContentView: View {
    @State private var images: [String] = ["chopper","luffy","nami","robin","sanji","sogeking","zoro"]
    
    var body: some View {VStack {
        ZStack{
            ForEach(images, id: \.self) { url in
                CardView(url: url)
            }
        }.shadow(color: .gray, radius:  0, x: 0, y: 2)
     
    }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
