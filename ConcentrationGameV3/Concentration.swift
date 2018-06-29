//
//  Concentration.swift
//  ConcentrationGameV3
//
//  Created by Светлана Сизова on 27.06.2018.
//  Copyright © 2018 Stacy Sizova. All rights reserved.
//

import Foundation
class Concentaration  {
    var cards = Array<Card>()
    
    var indexOfOnlyOneFacedUpCard: Int?
    
    func chooseCard(at index: Int){
        if !cards[index].isMatched{
            if let matchedIndex = indexOfOnlyOneFacedUpCard, matchedIndex != index{
                //check if cards are matched
                if cards[matchedIndex].identifier == cards[index].identifier{
                    cards[matchedIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFacedUp = true
                indexOfOnlyOneFacedUpCard = nil
            }
            else{
                //none or 2 cards are faced up
                for flipDownIndexes in cards.indices{
                    cards[flipDownIndexes].isFacedUp = false
                }
                cards[index].isFacedUp = true
                indexOfOnlyOneFacedUpCard = index
            }
        }
    }
    init(numberOfPairsOfCards: Int) {
        for _ in 0..<numberOfPairsOfCards{
            let card = Card()
            cards += [card,card]
            shuffleCards()
        }
        print(cards)
    }
    //TODO: Shuffle the cards
    func shuffleCards(){
        for _ in cards.indices{
            let randomNumberOne = Int(arc4random_uniform(UInt32(cards.count)))
            let randomNumberTwo = Int(arc4random_uniform(UInt32(cards.count)))
            if cards[randomNumberOne].identifier != cards[randomNumberTwo].identifier{
                var card = Card()
                card = cards[randomNumberTwo]
                cards[randomNumberOne] = cards[randomNumberTwo]
                cards[randomNumberTwo] = card
            }
        }
    }
}
