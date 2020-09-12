//
//  SetGameModel.swift
//  mySetGame
//
//  Created by ShinyMimikyu on 12/09/2020.
//

import Foundation

struct SetGameModel {
    private(set) var deck = Deck()
    private(set) var cardsCollected: Array<Card> = []
    var cardsOnTable: Array<Card> = []
    
//    init() {
//        deck = Deck()
//        print(validateCardSet(deck.cards[0], deck.cards[13], deck.cards[26]))
//    }
    
    // MARK: - Public func
    mutating func deal12() { dealCards(12) }
    mutating func deal3() { dealCards(3) }
    
    /// Collect cards from Table
    /// it will remove cards in cardsOnTable, and append to cardsCollected
    /// - Parameter cards: the array of cards to be collected
    mutating func collectCardsFromTable(_ cards: [Card]) {
        for card in cards {
            if let index = cardsOnTable.firstIndex(of: card) {
                cardsOnTable.remove(at: index)
            } else {
                // card collect is not available on table
                assert(false, "The collected cards have invalid card, not presented on Table")
            }
        }
    }
    
    /// Validate the three cards is a valid Set
    /// for definition of valid Set, check https://en.wikipedia.org/wiki/Set_(card_game)
    /// - Parameters:
    ///   - c1: first Card
    ///   - c2: second Card
    ///   - c3: third Card
    /// - Returns: true for a valid Set
    func validateCardSet(_ c1: Card, _ c2: Card, _ c3: Card) -> Bool {
        print(c1, c2, c3)
        if sameThree(c1.colour, c2.colour, c3.colour) {
            if uniqueOfThree(c1.numOfShape, c2.numOfShape, c3.numOfShape)
                && uniqueOfThree(c1.shape, c2.shape, c3.shape)
                && uniqueOfThree(c1.shading, c2.shading, c3.shading) {
                return true
            }
        }
        if sameThree(c1.numOfShape, c2.numOfShape, c3.numOfShape) {
           if uniqueOfThree(c1.colour, c2.colour, c3.colour)
               && uniqueOfThree(c1.shape, c2.shape, c3.shape)
               && uniqueOfThree(c1.shading, c2.shading, c3.shading) {
               return true
           }
        }
        if sameThree(c1.shape, c2.shape, c3.shape) {
           if uniqueOfThree(c1.colour, c2.colour, c3.colour)
               && uniqueOfThree(c1.numOfShape, c2.numOfShape, c3.numOfShape)
               && uniqueOfThree(c1.shading, c2.shading, c3.shading) {
               return true
           }
        }
        if sameThree(c1.shading, c2.shading, c3.shading) {
           if uniqueOfThree(c1.colour, c2.colour, c3.colour)
               && uniqueOfThree(c1.shape, c2.shape, c3.shape)
               && uniqueOfThree(c1.numOfShape, c2.numOfShape, c3.numOfShape) {
               return true
           }
        }
        return false
    }
 
    
    
    // MARK: - Private helper
    
    /// Deal cards from Deck to table
    /// - Parameter num: number of cards to deal, should be the multiple of 3
    private mutating func dealCards(_ num: Int) {
        assert(num%3 == 0, "Trying to deal invalid number of cards: \(num)")
        assert(num <= deck.cards.count, "Trying to deal cards(\(num)) more than what left in deck(\(deck.cards.count))")
        for _ in 0..<num {
            if let lastCard = deck.cards.popLast(){
                cardsOnTable.append(lastCard)
            }
        }
    }
    
    private func isSameColour(_ c1: Card, _ c2: Card, _ c3: Card) -> Bool{
        return c1.colour == c2.colour && c2.colour == c3.colour
    }

}


struct Deck {
    var cards: [Card] = []
    var numOfCards: Int
    
    init() {
        cards = Deck.genFullDeck()
        numOfCards = cards.count
//        for card in cards {
//            print(card)
//        }
    }

    static private func genFullDeck() -> [Card] {
        var temp: [Card] = []
        var uid: Int = 0
        for num_shape in 1...3 {
            for shape in Card.Shape.allCases {
                for shading in Card.Shading.allCases {
                    for colour in Card.Colour.allCases {
                        temp.append(Card(numOfShape: num_shape, shape: shape, shading: shading, colour: colour, id: uid))
                        uid += 1
                    } } }
        }
        return temp
    }
}

struct Card : Equatable, Identifiable{
    var numOfShape: Int
    var shape: Shape
    var shading: Shading
    var colour: Colour
    var status: CardStatus = .inDeck
    var isChosen: Bool = false
    
    var id: Int
    
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.numOfShape == rhs.numOfShape
            && lhs.shape == rhs.shape
            && lhs.shading == rhs.shading
            && lhs.colour == rhs.colour
    }
    
    // MARK: Constant
    enum Shape: CaseIterable { case diamond, squiggle, oval }
    enum Shading: CaseIterable { case solid, striped, open }
    enum Colour: CaseIterable { case red, green, purple}
    enum CardStatus { case inDeck, onTable, inHand}
}


func sameThree<T>(_ i1: T, _ i2: T, _ i3: T) -> Bool where T: Equatable{
    return i1 == i2 && i2 == i3
}

func uniqueOfThree<T>(_ i1: T, _ i2: T, _ i3: T) -> Bool where T: Equatable {
    return i1 != i2 && i1 != i3 && i2 != i3
}
