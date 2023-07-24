//
//  ViewController.swift
//  BlackjackGame
//
//  Created by Ihor Orlenko on 23.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var game = Blackjack()
    
    @IBOutlet weak var sitButton: UIButton!
    @IBOutlet weak var hitButton: UIButton!
    
    @IBOutlet weak var opponentScoreTitle: UILabel! {
        didSet {
            opponentScoreTitle.text = "Opponent: \(opponentScore)"
        }
    }
    @IBOutlet weak var playerScoreTitle: UILabel! {
        didSet {
            playerScoreTitle.text = "You: \(playerScore)"
        }
    }
    var playerScore: Int {
        get {
            return game.playerHand.cards.reduce(0) { $0 + $1.rank.blackjackValue() }
        }
        set {
            playerScoreTitle.text = "You: \(newValue)"
        }
    }
    var opponentScore: Int {
        get {
            return game.opponentHand.cards.reduce(0) { $0 + $1.rank.blackjackValue() }
        }
        set {
            opponentScoreTitle.text = "Opponent: \(newValue)"
        }
    }
    
    @IBAction func sitButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func hitButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func startGameButtonPressed(_ sender: UIButton) {
        sender.isHidden = true
        opponentScoreTitle.isHidden = false
        playerScoreTitle.isHidden = false
        sitButton.isHidden = false
        hitButton.isHidden = false
        updateViewFromModel()
    }
    
    @IBOutlet var playerCardImageViews: [UIImageView]!
    @IBOutlet var opponentCardImageViews: [UIImageView]!
    
    func updateViewFromModel() {
        for index in game.playerHand.cards.indices {
            playerCardImageViews[index].image = UIImage(named: game.playerHand.cards[index].description)
            playerCardImageViews[index].isHidden = false
        }
        for index in game.opponentHand.cards.indices {
            opponentCardImageViews[index].image = UIImage(named: game.opponentHand.cards[index].description)
            opponentCardImageViews[index].isHidden = false
        }
    }
    
}


// aspectRatio of card is 1.452
