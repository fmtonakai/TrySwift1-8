//
//  Card.swift
//  TrySwift1-8
//
//  Created by fm.tonakai on 3/6/16.
//  Copyright © 2016 fm.tonakai. All rights reserved.
//

import UIKit

enum Suit: Int {
    case Spade, Heart, Diamond, Club

    var description: String {
        switch self {
        case .Spade: return "♠️"
        case .Heart: return "❤️"
        case .Diamond: return "♦️"
        case .Club: return "♣️"
        }
    }

    var color: UIColor {
        switch self {
        case .Heart, .Diamond: return .redColor()
        case .Spade, .Club: return .blackColor()
        }
    }
}

enum Rank: Int {
    case Ace
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King

    var description: String {
        switch self {
        case .Ace: return "A"
        case .Jack: return "J"
        case .Queen: return "Q"
        case .King: return "K"
        default: return String(rawValue)
        }
    }
}

struct Card {
    let suit: Suit
    let rank: Rank

    var color: UIColor {
        return suit.color
    }
}

class Deck {
    func nextCard() -> Card {
        let suit = Suit(rawValue: numericCast(arc4random() % 4))!
        let rank = Rank(rawValue: numericCast(arc4random() % 13))!
        return Card(suit: suit, rank: rank)
    }
}