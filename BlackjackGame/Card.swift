//
//  Card.swift
//  BlackjackGame
//
//  Created by Ihor Orlenko on 23.07.2023.
//

import Foundation

enum Suit: CaseIterable {
    case clubs
    case hearts
    case spades
    case diamonds
}

enum Rank: CaseIterable {
    case two, three, four, five, six, seven, eight, nine, ten
    case king, queen, jack, ace
    
    func blackjackValue() -> Int {
        switch self {
        case .ace: return 1
        case .two: return 2
        case .three: return 3
        case .four: return 4
        case .five: return 5
        case .six: return 6
        case .seven: return 7
        case .eight: return 8
        case .nine: return 9
        case .ten, .king, .queen, .jack: return 10
        }
    }
}

struct Card: Equatable {
    let suit: Suit
    let rank: Rank
    private let identifier: String
    var description: String { identifier }
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    init(suit: Suit, rank: Rank) {
        self.suit = suit
        self.rank = rank
        self.identifier = "\(rank)of\(suit)"
    }

}
