//
//  Hand.swift
//  TrySwift1-8
//
//  Created by fm.tonakai on 3/6/16.
//  Copyright © 2016 fm.tonakai. All rights reserved.
//

import Foundation

struct Hand {
    private var deck = Deck()
    private var cards: [Card] = []

    var numberOfCards: Int {
        return cards.count
    }

    func cardAtPosition(index: Int) -> Card {
        return cards[index]
    }

    func addNewCardAtIndex(index: Int) -> Hand {
        return insertCard(deck.nextCard(), atIndex: index)
    }

    private func insertCard(card: Card, atIndex index: Int) -> Hand {
        var mutableCards = cards
        mutableCards.insert(card, atIndex: index)
        return Hand(deck: deck, cards: mutableCards)
    }

    func deleteCardAtIndex(index: Int) -> Hand {
        var mutableCards = cards
        mutableCards.removeAtIndex(index)
        return Hand(deck: deck, cards: mutableCards)
    }

    func moveCard(fromIndex: Int, toIndex: Int) -> Hand {
        return deleteCardAtIndex(fromIndex)
            .insertCard(cards[fromIndex], atIndex: toIndex)
    }
}