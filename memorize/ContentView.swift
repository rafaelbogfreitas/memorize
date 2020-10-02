//
//  ContentView.swift
//  memorize
//
//  Created by Rafael Freitas on 01/10/20.
//

import SwiftUI

let emojis = [
    "👻",
    "😋",
    "😚",
    "😇",
]

struct ContentView: View {
    var body: some View {
        HStack {
            ForEach(0..<emojis.count) {index in
                CardView(isFaceUp: true, emoji: emojis[index])
            }
        }
            .padding()
            .foregroundColor(.orange)
            .font(.largeTitle)
    }
}

struct CardView: View {
        
    var isFaceUp: Bool
   
    var emoji: String
    
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 10.0)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0)
                    .stroke(lineWidth: 3)
                Text(emoji)
            } else {
                
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }
        
    }
}






























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
