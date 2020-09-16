//
//  PlayersViewController.swift
//  ParaszActivityV2
//
//  Created by Nagy Boldizsár on 2020. 06. 15..
//  Copyright © 2020. Nagy Boldizsár. All rights reserved.
//

import UIKit

class PlayersViewController: UIViewController {
    
    @IBOutlet weak var team1: UILabel!
    @IBOutlet weak var team2: UILabel!
    @IBOutlet weak var team3: UILabel!
    @IBOutlet weak var team4: UILabel!
    @IBOutlet weak var team5: UILabel!
    @IBOutlet weak var team6: UILabel!
    @IBOutlet weak var wordsNumberLabel: UILabel!
    var brain : Brain?
    var teams = [Team]()
    var numberOfWords = 3
    var totalWords = 12
    
    override func viewDidLoad() {
        super.viewDidLoad()
        team1.text = ""
        team2.text = ""
        team3.text = ""
        team4.text = ""
        team5.text = ""
        team6.text = ""
        writeNames()
    }
    @IBAction func sliderChanged(_ sender: UISlider) {
        numberOfWords = Int(sender.value)
        wordsNumberLabel.text = "\(numberOfWords)"
        
        if let totalPlayers = brain?.getTotalPlayers() {
            totalWords = totalPlayers * numberOfWords
        }
    }
    
    @IBAction func startPressed(_ sender: UIButton) {
    }
    
    func writeNames(){
        let teamsLabelArray : [UILabel] = [team1, team2, team3, team4, team5, team6]
        if let array = brain?.teamsToString(teams: teams) {
            let x = array.count
            var i = 0
            while x > i {
                teamsLabelArray[i].text = array[i]
                teamsLabelArray[i].textColor = teams[i].color
                i += 1
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goToWords") {
            let destinationVC = segue.destination as! WordsViewController
            destinationVC.brain = brain
            destinationVC.teams = brain!.teams
            destinationVC.totalWords = totalWords
        }
    }
        
}
