//
//  ViewController.swift
//  concentration
//
//  Created by Yessen Yermukhanbet on 11/23/19.
//  Copyright © 2019 Yessen Yermukhanbet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    lazy var game = Concentration( numberOfPairsOfCards: numberOfPairs) //creating set of cards
    var numberOfPairs: Int {
        return (cardButtons.count+1)/2
    }

    //everytime we change flipcount, it executes the code inside
    var flipCount = 0{
        didSet{                 //Property observer
            flipCounts.text = "Flip counts: \(flipCount)"
        }
    }
    
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var flipCounts: UILabel!
    @IBAction func ButtonPressed(_ sender: UIButton) {
        print("The number of total cards: \(cardButtons.count)")
        flipCount+=1
        if let cardIndex = cardButtons.lastIndex(of: sender){
            game.chooseCard(at: cardIndex)
            updateViewFromModel()
            print(game.cards[cardIndex])
        }
        else{
            print("No such card found!")
        }
    }
    
    func updateViewFromModel(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFacedUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }
            else{
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
        
    }
    
    var emojiChoices = ["🦁","🍕","🤦🏼‍♀️","🐵","🦉","👽","🤠","🐨"]
    var emoji = [Int:String]()
    
    func emoji(for card: Card) -> String{
        if emoji[card.identifier] == nil, emojiChoices.count > 0{
            var emojiIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: emojiIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
    
    // MARK: Here is the mark
    
    
    @IBAction func newGameButton(_ sender: UIButton) {
        emojiChoices = ["🦁","🍕","🤦🏼‍♀️","🐵","🦉","👽","🤠","🐨"]
        flipCount = 0
        game = Concentration(numberOfPairsOfCards: (cardButtons.count+1)/2)
        for _ in cardButtons.indices{
            updateViewFromModel()
        }
    }
 
}

