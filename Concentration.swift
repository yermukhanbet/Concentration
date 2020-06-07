//
//  Concentration.swift
//  concentration
//
//  Created by Yessen Yermukhanbet on 11/25/19.
//  Copyright © 2019 Yessen Yermukhanbet. All rights reserved.
//

import Foundation

class Concentration{
    var cards = [Card]()
    var indexOfOneAndOnlyFacedUpCard:Int?
    
    func chooseCard(at index: Int){
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFacedUpCard, matchIndex != index{
                //check if cards match!
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFacedUp = true
                indexOfOneAndOnlyFacedUpCard = nil
            }else{
                //either no cards or 2 cards are faced up
                for index in cards.indices{
                    cards[index].isFacedUp = false
                }
                cards[index].isFacedUp = true
                indexOfOneAndOnlyFacedUpCard = index
            }
        }
    }
    //constructor of concentration game:
    init(numberOfPairsOfCards: Int) {
        print(numberOfPairsOfCards)
        for _ in 1...numberOfPairsOfCards{
            let card = Card()
            cards+=[card,card]
        }
        cards.shuffle()
        print(cards)
    }
}
