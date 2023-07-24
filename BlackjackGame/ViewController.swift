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
            updateOpponentScoreLabel()
        }
    }
    @IBOutlet weak var playerScoreTitle: UILabel! {
        didSet {
            updatePlayerScoreLabel()
        }
    }
    var playerScore: Int {
        return game.playerHand.cards.reduce(0) { $0 + $1.rank.blackjackValue() }
    }
    var opponentScore: Int {
        return game.opponentHand.cards.reduce(0) { $0 + $1.rank.blackjackValue() }
    }
    func updatePlayerScoreLabel() {
        playerScoreTitle.text = "You: \(playerScore)"
    }
    func updateOpponentScoreLabel() {
        opponentScoreTitle.text = "Opponent: \(opponentScore)"
    }
    
    @IBAction func sitButtonPressed(_ sender: UIButton) {
        game.dealCard(to: game.opponentHand)
        updateViewFromModel()
    }
    
    @IBAction func hitButtonPressed(_ sender: UIButton) {
        game.dealCard(to: game.playerHand)
        game.dealCard(to: game.opponentHand)
        updateViewFromModel()
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
            updatePlayerScoreLabel()
        }
        for index in game.opponentHand.cards.indices {
            opponentCardImageViews[index].image = UIImage(named: game.opponentHand.cards[index].description)
            opponentCardImageViews[index].isHidden = false
            updateOpponentScoreLabel()
        }
        if playerScore > 21 && opponentScore > 21 {
            // Draw
        } else if playerScore > 21 {
            // Lose
        } else if opponentScore > 21 {
            // Win
        }
    }
    
}


// aspectRatio of card is 1.452
