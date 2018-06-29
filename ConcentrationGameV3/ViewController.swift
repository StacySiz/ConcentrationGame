//
//  ViewController.swift
//  ConcentrationGameV3
//
//  Created by Светлана Сизова on 25.06.2018.
//  Copyright © 2018 Stacy Sizova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentaration(numberOfPairsOfCards: (cardButton.count + 1)/2)
    
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet var cardButton: [UIButton]!
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButton.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print ("chosen card was not in cardButton")
        }
    }
    
    func updateViewFromModel(){
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
    
    var emojiChoices = ["🦆","🐻","🦈","🐡","🐒","🐗"]

    var emoji =  [Int:String]()
    
    func emoji(for card: Card) -> String{
        if emoji[card.identifier] == nil,emojiChoices.count > 0{
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
}

