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
    
    var users: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addPlayerAction(_ sender: UIButton) {
        let currentPlayer: String = userName.text!
        playerLabel.text = currentPlayer
        users.append(currentPlayer)
        
        userDefaults.set(users, forKey: "usernames")
    }

    @IBAction func addToScoreAction(_ sender: UIButton) {
        
    }
    
    @IBAction func resetScoreAndPlayerAction(_ sender: UIButton) {
        
    }

}

