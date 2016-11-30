//
//  ViewController.swift
//  NSUserDefaults
//
//  Created by Yan Malinovsky on 29.11.16.
//  Copyright © 2016 Yan Malinovsky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var playerLabel: UILabel!
    
    @IBOutlet var scoreLabel: UILabel!
    
    @IBOutlet var hightScore: UILabel!
    
    @IBOutlet var leaderName: UILabel!
    
    @IBOutlet var userName: UITextField!
    
    let userDefaults = UserDefaults.standard
    
    var currentPlayer: String = String()
    
    var currentPlayerScore: Int = Int()
    
    var highestScore: Int = Int()
    
    var playerNameWithHighestScore: String = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if (userDefaults.value(forKey: "highest_score") != nil) && (userDefaults.value(forKey: "leader_name") != nil) {
            highestScore = userDefaults.value(forKey: "highest_score") as! Int
            hightScore.text = String(highestScore)

            playerNameWithHighestScore = userDefaults.value(forKey: "leader_name") as! String
            leaderName.text = playerNameWithHighestScore
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addPlayerAction(_ sender: UIButton) {
        currentPlayer = userName.text!
        userName.text = String()
        userName.resignFirstResponder()
        
        resetScore()
        
        playerLabel.text = currentPlayer
    }

    @IBAction func addToScoreAction(_ sender: UIButton) {
        if (currentPlayer.isEmpty){
            currentPlayerScore = currentPlayerScore + 10
            scoreLabel.text = String(currentPlayerScore)

            if currentPlayerScore > highestScore {
                highestScore = currentPlayerScore
                playerNameWithHighestScore = currentPlayer

                hightScore.text = String(highestScore)
                leaderName.text = playerNameWithHighestScore

                userDefaults.set(highestScore, forKey: "highest_score")
                userDefaults.set(currentPlayer, forKey: "leader_name")
            }
        }
    }
    
    func resetScore() {
        scoreLabel.text = String()
        currentPlayerScore = Int()
    }
    
    @IBAction func resetScoreAndPlayerAction(_ sender: UIButton) {
        playerLabel.text = String()
        currentPlayer = String()
        
        resetScore()
    }

}

