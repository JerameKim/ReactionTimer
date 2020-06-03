//
//  ViewController.swift
//  ReactionTimer2
//
//  Created by Jerame Kim on 6/3/20.
//  Copyright © 2020 Jerame Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var startDate = Date()
    var endDate = Date()
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var endButton: UIButton!
    @IBOutlet weak var messageLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.setTitle("", for: .normal)
        endButton.setTitle("", for: .normal)
        
        // on button press set button color to blue
        startButton.backgroundColor = UIColor.blue
        startButton.setTitleColor(.black, for: .normal)
        endButton.isHidden = true
    }
    
    @IBAction func startPressed(_ sender: Any) {
        // on button press set screen/button color to red
        startButton.backgroundColor = UIColor.red
        
        // hide the start message
        messageLabel.isHidden = true
        // create a random countdown for the trigger to be started
        let triggerTime = Double.random(in: 3...6)
        print(triggerTime)
        
        // do gameStart() 4seconds after the butotn has been pressed
        perform(#selector(gameStart), with: nil, afterDelay: triggerTime)
        
    }
    
    @IBAction func endPressed(_ sender: Any) {
        endButton.backgroundColor = UIColor.white
        endDate = Date()
        
        let elapsedTime = endDate.timeIntervalSince(startDate)
        messageLabel.isHidden = false
        messageLabel.text = "Your reaction time was \(elapsedTime)s"
    }
    
    // gets called after delay
    @objc func gameStart() {
        startButton.isHidden = true
        endButton.isHidden = false
        endButton.backgroundColor = UIColor.green
        
        startDate = Date()
        
        
    }


}

