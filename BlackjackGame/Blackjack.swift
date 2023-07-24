//
//  Blackjack.swift
//  BlackjackGame
//
//  Created by Ihor Orlenko on 23.07.2023.
//

import Foundation

struct Hand {
    var cards = [Card]()
    mutating func addCard(card: Card) {
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
    
    var playerHand = Hand()
    var opponentHand = Hand()
    
    init() {
        makeDeck()
        for _ in 0..<2 {
            playerHand.addCard(card: deck.remove(at: 0))
            opponentHand.addCard(card: deck.remove(at: 0))
        }
    }
}
