//
//  ViewController.swift
//  ConcentrationGameV3
//
//  Created by Светлана Сизова on 25.06.2018.
//  Copyright © 2018 Stacy Sizova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private  lazy var game = Concentaration(numberOfPairsOfCards: numberOfPairsOfCards)
    
     var numberOfPairsOfCards: Int{
            return (cardButton.count+1)/2
    }
    
    private(set) var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet private var cardButton: [UIButton]!
    
    @IBOutlet private weak var flipCountLabel: UILabel!
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButton.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print ("chosen card was not in cardButton")
        }
    }
    
    private  func updateViewFromModel(){
        for index in cardButton.indices{
            let button = cardButton[index]
            let card = game.cards[index]
            if card.isFacedUp{
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
            else{
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0):#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
            }
        }
    }
    
    private var emojiChoices = ["🦆","🐻","🦈","🐡","🐒","🐗"]

    private var emoji =  [Int:String]()
    
    private func emoji(for card: Card) -> String{
        if emoji[card.identifier] == nil,emojiChoices.count > 0{
            emoji[card.identifier] = emojiChoices.remove(at: emojiChoices.count.arc4random)
        }
        return emoji[card.identifier] ?? "?"
    }
}
extension Int{
    var arc4random: Int{
        if self > 0{
            return Int(arc4random_uniform(UInt32(self)))
        }
        else if self < 0{
            return -Int(arc4random_uniform(UInt32(abs(self))))
        }
        else{
            return 0
        }
    }
}








