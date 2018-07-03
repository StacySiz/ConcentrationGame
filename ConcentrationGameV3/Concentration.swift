//
//  Concentration.swift
//  ConcentrationGameV3
//
//  Created by Светлана Сизова on 27.06.2018.
//  Copyright © 2018 Stacy Sizova. All rights reserved.
//

import Foundation

struct Concentaration  {
    private(set)  var cards = Array<Card>()
    
    private var indexOfOnlyOneFacedUpCard: Int?{
        get{
            var foundIndex : Int?
            for index in cards.indices{
                if cards[index].isFacedUp{
                    if foundIndex == nil{
                        foundIndex = index
                    }
                    else{
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set{
            for index in cards.indices{
                cards[index].isFacedUp = (index == newValue)
            }
        }
    }
    
    mutating func chooseCard(at index: Int){
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)) chosen index is not in the cards")
        if !cards[index].isMatched{
            if let matchedIndex = indexOfOnlyOneFacedUpCard, matchedIndex != index{
                //check if cards are matched
                if cards[matchedIndex] == cards[index]{
                    cards[matchedIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFacedUp = true
            }
            else{
                indexOfOnlyOneFacedUpCard = index
            }
        }
    }
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "Concentration.init(at: \(numberOfPairsOfCards)) you must have at least one pair of cards")
        for _ in 0..<numberOfPairsOfCards{
            
            let card = Card()
            cards += [card,card]
            //shuffleCards()
        }
        print(cards)
    }
    //Shuffle the cards
    mutating func shuffleCards(){
        for _ in cards.indices{
            let randomNumberOne = cards.count.arc4random
            let randomNumberTwo = cards.count.arc4random
            if cards[randomNumberOne] != cards[randomNumberTwo]{
                var card = Card()
                card = cards[randomNumberTwo]
                cards[randomNumberOne] = cards[randomNumberTwo]
                cards[randomNumberTwo] = card
            }
        }
    }
}
