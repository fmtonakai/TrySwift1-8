//
//  Hand.swift
//  TrySwift1-8
//
//  Created by fm.tonakai on 3/6/16.
//  Copyright © 2016 fm.tonakai. All rights reserved.
//

import Foundation

struct Hand: DataType {
    private var deck: Deck
    private var cards: [Card] = []

    init() {
        deck = Deck()
    }

    private init(deck: Deck, cards: [Card]){
        self.deck = deck
        self.cards = cards
    }

    subscript(index: Int) -> Card {
        return itemAtPosition(index)
    }

    var numberOfItems: Int {
        return cards.count
    }

    func itemAtPosition(index: Int) -> Card {
        return cards[index]
    }

    func addNewItemAtIndex(index: Int) -> Hand {
        return insertItem(deck.nextCard(), atIndex: index)
    }

    private func insertItem(card: Card, atIndex index: Int) -> Hand {
        var mutableCards = cards
        mutableCards.insert(card, atIndex: index)
        return Hand(deck: deck, cards: mutableCards)
    }

    func deleteItemAtIndex(index: Int) -> Hand {
        var mutableCards = cards
        mutableCards.removeAtIndex(index)
        return Hand(deck: deck, cards: mutableCards)
    }

    func moveItem(fromIndex: Int, toIndex: Int) -> Hand {
        return deleteItemAtIndex(fromIndex)
            .insertItem(cards[fromIndex], atIndex: toIndex)
    }
}