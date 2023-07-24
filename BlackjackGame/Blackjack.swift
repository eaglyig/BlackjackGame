//
//  Blackjack.swift
//  BlackjackGame
//
//  Created by Ihor Orlenko on 23.07.2023.
//

import Foundation

class Hand {
    var cards = [Card]()
    func addCard(card: Card) {
        cards.append(card)
    }
}

struct Blackjack {
    private(set) var deck = [Card]()
    
    private mutating func makeDeck() {
        for suit in Suit.allCases {
            for rank in Rank.allCases {
                deck.append(Card(suit: suit, rank: rank))
            }
        }
        deck.shuffle()
    }
    
    private(set) var playerHand = Hand()
    private(set) var opponentHand = Hand()
    
    mutating func dealCard(to hand: Hand) {
        hand.addCard(card: deck.remove(at: 0))
    }
    
    init() {
        makeDeck()
        for _ in 0..<2 {
            dealCard(to: playerHand)
            dealCard(to: opponentHand)
        }
    }
}
