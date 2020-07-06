//
//  GameViewController.swift
//  ParaszActivityV2
//
//  Created by Nagy Boldizsár on 2020. 06. 16..
//  Copyright © 2020. Nagy Boldizsár. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var currentTeamLabel: UILabel!
    @IBOutlet weak var currentPlayerLabel: UILabel!
    @IBOutlet weak var pointCounterLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var currentWord: UILabel!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var wrongButton: UIButton!
    @IBOutlet weak var starterTimer: UILabel!
    var brain : Brain?
    var teams = [Team]()
    var totalWords: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        start()
    }
    
    var timer = Timer()
    
    func updateTime() {
        
    }
    func start() {
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    var threeSec = 3
    @objc func updateCounter() {
        
        if threeSec > 0 {
            starterTimer.text = "\(threeSec)"
            threeSec -= 1
        }else {
            timer.invalidate()
            starterTimer.isHidden = true
            currentWord.isHidden = false
            currentTeamLabel.isHidden = false
            pointCounterLabel.isHidden = false
            timerLabel.isHidden = false
            currentPlayerLabel.isHidden = false
            rightButton.isHidden = false
            wrongButton.isHidden = false
     }
    }
    
    func initialize() {
        currentWord.isHidden = true
        currentTeamLabel.isHidden = true
        pointCounterLabel.isHidden = true
        timerLabel.isHidden = true
        currentPlayerLabel.isHidden = true
        rightButton.isHidden = true
        wrongButton.isHidden = true
        
    }
    @IBAction func correctWordButton(_ sender: UIButton) {
        performSegue(withIdentifier: "goBackToScore", sender: self)
    }
    
    @IBAction func wrongWordButton(_ sender: UIButton) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if (segue.identifier == "goBackToScore") {
        let destinationVC = segue.destination as! ScoreBoardViewController
        destinationVC.brain = brain
        destinationVC.teams = brain!.teams
        destinationVC.totalWords = totalWords
        }
    }
}

