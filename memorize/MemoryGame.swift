//
//  MemoryGame.swift
//  memorize
//
//  Created by Rafael Freitas on 03/10/20.
//

import Foundation

struct MemoryGame<CardContent> {
    
    var cards: [Card]
    
    public func choose( card: Card) {
            print(card)
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
