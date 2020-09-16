    //
    //  GameViewController.swift
    //  ParaszActivityV2
    //
    //  Created by Nagy Boldizsár on 2020. 06. 16..
    //  Copyright © 2020. Nagy Boldizsár. All rights reserved.
    //
    
    import UIKit
    import AVFoundation
    
    class GameViewController: UIViewController {
        
        @IBOutlet weak var currentTeamLabel: UILabel!
        @IBOutlet weak var currentPlayerLabel: UILabel!
        @IBOutlet weak var pointCounterLabel: UILabel!
        @IBOutlet weak var timerLabel: UILabel!
        @IBOutlet weak var currentWord: UILabel!
        @IBOutlet weak var rightButton: UIButton!
        @IBOutlet weak var wrongButton: UIButton!
        @IBOutlet weak var starterTimer: UILabel!
        @IBOutlet weak var roundLabel: UILabel!
        @IBOutlet weak var constPointsLabel: UILabel!
        @IBOutlet weak var constRoundLabel: UILabel!
        @IBOutlet weak var roundCounterLabel: UILabel!
        
        var expressions = [String]()
        var brain : Brain?
        var teams = [Team]()
        var optGameTime : Int?
        var totalWords: Int?
        var gameTime = 20
        var currentRound = 0
        var newList = [String]()
        var roundEnded = false
        var labels = [UILabel]()
        var currentTeam = 0
        
        override func viewDidLoad() {
            super.viewDidLoad()
            currentRound += 1
            roundLabel.text = "\(currentRound)"
            initialize()
            start()
            pickExpression()
        }
        var timer = Timer()
        var timeIsUp = false
        func startTimer() {
            if let safeGameTime = optGameTime {
                manageLabels()
                gameTime = safeGameTime
                timer.invalidate()
                roundLabel.text = "\(currentRound)"
                timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateGameTimer), userInfo: nil, repeats: true)
            }
        }
        
        @objc func updateGameTimer() {
            
            if expressions.count == 0 {
                timer.invalidate()
                roundIsOver()
            }else  {
                if gameTime > 3 {
                    timerLabel.text = "\(gameTime)"
                    gameTime -= 1
                    timeIsUp = false
                }else if gameTime > 0 {
                    timerLabel.text = "\(gameTime)"
                    gameTime -= 1
                    //makeBeepingSound()
                }
                else {
                    timer.invalidate()
                    timerLabel.text = "Guess"
                    timeIsUp = true
                    //bounjour()
                }
            }
        }
        func manageLabels(){
            let team: Team = teams[currentTeam]
            let score = team.score
            pointCounterLabel.text = "\(score)"
            currentTeamLabel.text = "Team \(currentTeam)"
            currentPlayerLabel.text = "\(team.players[team.currentPlayer].name)"
            roundCounterLabel.text = "\(currentRound)"
        }
        
        func roundIsOver() {
            currentRound += 1
            
            timer.invalidate()
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(roundOverTimer), userInfo: nil, repeats: true)
            
        }
        var three = 3
        
        @objc func roundOverTimer() {
            rightButton.isEnabled = false
            rightButton.isEnabled = false
            starterTimer.isHidden = false
            if three > 0 {
                starterTimer.text = "\(three)"
                three -= 1
            }else {
                
                timer.invalidate()
                for label in labels {
                    label.isHidden = true
                }
                rightButton.isHidden = true
                wrongButton.isHidden = true
                rightButton.isEnabled = true
                wrongButton.isEnabled = true
                timerLabel.text = "\(optGameTime!)"
                
                performSegue(withIdentifier: "goBackToScore", sender: self)
            }
            
        }
        
        
        func pickExpression(){
            let x = expressions.count-1
            if x >= 0 {
                let tmp = expressions[x]
                currentWord.text = tmp
            }else {
                print("out of range")
            }
            
        }
        
        func shuffleExpressions() {
            let x = expressions.count
            var i = 0
            
            while i < x {
                let rnd = Int.random(in: 0...x-1)
                let tmp = expressions[i]
                expressions[i] = expressions[rnd]
                expressions[rnd] = tmp
                i += 1
            }
        }
        
        func nextExpression(timeUp: Bool, userGuess: Bool) {
            let x = expressions.count-1
            let remainingExpressions = expressions.count
            
            if remainingExpressions > 0 {
                let tmp = expressions[x]
                //there are still expressions
                if timeUp == false {
                    //there is still time
                    if userGuess == true {
                        //correct guess
                        newList.append(tmp)
                        expressions.remove(at: x)
                        shuffleExpressions()
                        pickExpression()
                        print("correct guess")
                        
                    }else {
                        //wrong guess
                        shuffleExpressions()
                        pickExpression()
                        print("wrong guess")
                    }
                }else {
                    if userGuess == true {
                        newList.append(tmp)
                        expressions.remove(at: x)
                        print("last correct guess")
                        print("next team")
                        nextTeam()
                    }else {
                        shuffleExpressions()
                        print("last wrong guess")
                        print("next team")
                        nextTeam()
                    }
                }
                
            }else {
                //no more expressions
                roundIsOver()
            }
        }
        func lastExpression(userGuess: Bool){
            
            
        }
        
        func isRoundOver() {
            if expressions.count == 0 {
                roundIsOver()
            }
        }
        
        func nextPlayer() {
            var team = teams[currentTeam]
            if team.currentPlayer < team.players.count {
                team.currentPlayer += 1
            }else {
                team.currentPlayer = 0
            }
            
        }
        @objc func nextPlayerCounter() {
            if threeSec > 0 {
                threeSec -= 1
                //makeBeepingSound()
            }else {
                timer.invalidate()
                start()
            }
        }
        
        func nextTeam() {
            
            if currentTeam < teams.count-1 {
                currentTeam += 1
            }else {
                currentTeam = 0
                nextPlayer()
            }
            let team = teams[currentTeam]
            initialize()
            starterTimer.isHidden = false
            starterTimer.text = "\(team.players[team.currentPlayer].name)"
            timer.invalidate()
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(nextPlayerCounter), userInfo: nil, repeats: true)
        }
        
        
        
        func initialize() {
            labels = [currentWord, currentTeamLabel, currentPlayerLabel, pointCounterLabel, timerLabel, roundLabel, constRoundLabel, constPointsLabel, roundCounterLabel]
            for label in labels {
                label.isHidden = true
            }
            rightButton.isHidden = true
            wrongButton.isHidden = true
            shuffleExpressions()
            
        }
        
        
        @IBAction func correctWordButton(_ sender: UIButton) {
            let guess = true
            if expressions.count == 1 {
                
            }else {
                nextExpression(timeUp: timeIsUp, userGuess: guess)
            }
            
            
        }
        
        @IBAction func wrongWordButton(_ sender: UIButton) {
            let guess = false
            if expressions.count == 1 {
                
            }else {
                nextExpression(timeUp: timeIsUp, userGuess: guess)
            }
        }
        
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if (segue.identifier == "goBackToScore") {
                let destinationVC = segue.destination as! ScoreBoardViewController
                destinationVC.brain = brain
                destinationVC.teams = brain!.teams
                destinationVC.totalWords = totalWords
                timer.invalidate()
            }
        }
        
        
        //MARK: - Starter 3 secs
        
        
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
                for label in labels {
                    label.isHidden = false
                }
                starterTimer.isHidden = true
                rightButton.isHidden = false
                wrongButton.isHidden = false
                timerLabel.text = "\(optGameTime!)"
                startTimer()
                threeSec = 3
            }
        }
        
        
        
        //MARK: - Sounds
        
        
        func makeBeepingSound() {
            guard let url = Bundle.main.url(forResource: "countdown", withExtension: "mp3") else { return }
            
            do {
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                try AVAudioSession.sharedInstance().setActive(true)
                
                player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
                
                guard let player = player else { return }
                
                player.play()
                
            } catch let error {
                print(error.localizedDescription)
            }
        }
        var player : AVAudioPlayer?
        
        func bounjour() {
            guard let url = Bundle.main.url(forResource: "baunjour", withExtension: "mp3") else { return }
            
            do {
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                try AVAudioSession.sharedInstance().setActive(true)
                
                player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
                
                guard let player = player else { return }
                
                player.play()
                
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
    
