//
//  MemoryGame.swift
//  memorize
//
//  Created by Rafael Freitas on 03/10/20.
//

import Foundation

struct MemoryGame<CardContent> {
    
    var cards: [Card]
    
    init(numberOfPairsOfCards: Int, cardFactory: (Int) -> CardContent){
       cards = Array<Card>()
        
        for i in 0..<numberOfPairsOfCards {
            let content = cardFactory(i)
            let card = Card(content: content, id: i*2)
            let card2 = Card(content: content, id: i*2+1)
            cards.append(card)
            cards.append(card2)
        }
    }
    
    public func choose( card: Card) {
            print(card)
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
