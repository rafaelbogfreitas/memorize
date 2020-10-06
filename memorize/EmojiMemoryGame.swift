//
//  EmojiMemoryGame.swift
//  memorize
//
//  Created by Rafael Freitas on 03/10/20.
//

import SwiftUI

//MARK: - ViewModel

/*
    The ViewModel file is essencially a "portal" between the view and the model
*/

class EmojiMemoryGame: ObservableObject {
    //(set)
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
        
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = [ "👻", "😋", "😚", "😇" ]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) {
            emojis[$0]
        }
    }
    
    //MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    //MARK: - Intents
    
    public func choose(card: MemoryGame<String>.Card){
        model.choose(card: card)
    }
}

struct EmojiMemoryGame_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
