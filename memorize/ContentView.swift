//
//  ContentView.swift
//  memorize
//
//  Created by Rafael Freitas on 01/10/20.
//

import SwiftUI

struct ContentView: View {
    
    var viewModel: EmojiMemoryGame
    
    var body: some View {
        HStack {
            ForEach(viewModel.cards) {
                CardView(card: $0)
            }
        }
            .padding()
            .foregroundColor(.orange)
            .font(.largeTitle)
    }
}

struct CardView: View {
    
    var card: MemoryGame<String>.Card

    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0)
                    .stroke(lineWidth: 3)
                Text(card.content)
            } else {
                
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }
        
    }
}






























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}
