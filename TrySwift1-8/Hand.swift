//
//  Hand.swift
//  TrySwift1-8
//
//  Created by fm.tonakai on 3/6/16.
//  Copyright © 2016 fm.tonakai. All rights reserved.
//

import Foundation

struct Hand {
    private let deck = Deck()
    private var cards: [Card] = []

    var numberOfCards: Int {
        return cards.count
    }

    func cardAtPosition(index: Int) -> Card {
        return cards[index]
    }

    mutating func addNewCardAtIndex(index: Int) {
        insertCard(deck.nextCard(), atIndex: index)
    }

    private mutating func insertCard(card: Card, atIndex index: Int) {
        cards.insert(card, atIndex: index)
    }

    mutating func deleteCardAtIndex(index: Int) {
        cards.removeAtIndex(index)
    }

    mutating func moveCard(fromIndex: Int, toIndex: Int) {
        let cardToMove = cards[fromIndex]
        deleteCardAtIndex(fromIndex)
        insertCard(cardToMove, atIndex: toIndex)
    }
}