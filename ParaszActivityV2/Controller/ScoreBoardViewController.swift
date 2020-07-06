//
//  ScoreBoardViewController.swift
//  ParaszActivityV2
//
//  Created by Nagy Boldizsár on 2020. 06. 16..
//  Copyright © 2020. Nagy Boldizsár. All rights reserved.
//

import UIKit

class ScoreBoardViewController: UIViewController {
    
    @IBOutlet weak var team1: UILabel!
    @IBOutlet weak var team2: UILabel!
    @IBOutlet weak var team3: UILabel!
    @IBOutlet weak var team4: UILabel!
    @IBOutlet weak var team5: UILabel!
    @IBOutlet weak var team6: UILabel!
    @IBOutlet weak var team1Score: UILabel!
    @IBOutlet weak var team2Score: UILabel!
    @IBOutlet weak var team3Score: UILabel!
    @IBOutlet weak var team4Score: UILabel!
    @IBOutlet weak var team5Score: UILabel!
    @IBOutlet weak var team6Score: UILabel!
    
    
    var brain : Brain?
    var teams = [Team]()
    var totalWords: Int?
    var scores = [Int]()
    override func viewDidLoad() {
        super.viewDidLoad()
        team1.text = ""
        team2.text = ""
        team3.text = ""
        team4.text = ""
        team5.text = ""
        team6.text = ""
        team1Score.text = ""
        team2Score.text = ""
        team3Score.text = ""
        team4Score.text = ""
        team5Score.text = ""
        team6Score.text = ""
        initialize()
    }
    
    func initialize() {
        let teamLabels: [UILabel] = [team1, team2, team3, team4, team5, team6]
        let teamScores: [UILabel] = [team1Score, team2Score, team3Score, team4Score, team5Score, team6Score]
        let numOfTeams = teams.count
        var i = 0
        while i < numOfTeams {
            teamLabels[i].text = "Team \(i + 1)"
            teamLabels[i].textColor = teams[i].color
            teamScores[i].text = "0"
            teamScores[i].textColor = teams[i].color
            scores.append(0)
            i += 1
        }
    }
    
    @IBAction func startPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToGame", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if (segue.identifier == "goToGame") {
        let destinationVC = segue.destination as! GameViewController
        destinationVC.brain = brain
        destinationVC.teams = brain!.teams
        destinationVC.totalWords = totalWords
        }
    }
}


