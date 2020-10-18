//
//  MemoryGame.swift
//  memorize
//
//  Created by Rafael Freitas on 03/10/20.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    
    private(set) var cards: [Card]
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
        get {
            cards.indices.filter { cards[$0].isFaceUp }.only
        }
    }
    
    init(numberOfPairsOfCards: Int, cardFactory: (Int) -> CardContent){
       cards = Array<Card>()
        
        for i in 0..<numberOfPairsOfCards {
            let content = cardFactory(i)
            let card = Card(content: content, id: i*2)
            let card2 = Card(content: content, id: i*2+1)
            cards.append(card)
            cards.append(card2)
        }
        
        cards.shuffle()
    }
    
    mutating public func choose(card: Card) {
        if let chosenIndex = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                self.cards[chosenIndex].isFaceUp = true
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false {
            didSet {
                if isFaceUp {
                    startUsingBonusTime()
                } else {
                    stopUsingBonusTime()
                }
            }
        }
        
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
        
        //MARK: - Bonus Time

        var bonusTimeLimit: TimeInterval = 6

        private var faceUpTime: TimeInterval {
            if let lastFaceUpDate = lastFaceUpDate {
                return pastFaceUpTime + Date().timeIntervalSince(lastFaceUpDate)
            } else {
                return pastFaceUpTime
            }
        }

        var lastFaceUpDate: Date?

        var pastFaceUpTime: TimeInterval = 0

        var bonusTimeRemaining: TimeInterval {
            max(0, bonusTimeLimit - faceUpTime)
        }

        var bonusRemaining: Double {
            (bonusTimeLimit > 0 && bonusTimeLimit > 0) ? bonusTimeRemaining / bonusTimeLimit : 0
        }

        var hasEarnedBonus: Bool {
            isMatched && bonusRemaining > 0
        }
        
        var isConsumingBonusTime: Bool {
            isFaceUp && !isMatched && bonusTimeRemaining > 0
        }
        
        mutating private func startUsingBonusTime() {
            if isConsumingBonusTime, lastFaceUpDate == nil {
                lastFaceUpDate = Date()
            }
        }
        
        mutating private func stopUsingBonusTime() {
            lastFaceUpDate = nil
            pastFaceUpTime = faceUpTime
        }
    }
    
}


