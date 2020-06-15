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
            print(totalWords)
        }
    }
    
    
    @IBAction func startPressed(_ sender: UIButton) {
        
    }
    
    func writeNames(){
        if let array = brain?.teamsToString(teams: teams) {
            print(array[0])
            switch array.count {
            case 2:
                team1.text = array[0]
                team2.text = array[1]
                team1.textColor = teams[0].color
                team2.textColor = teams[1].color
            case 3:
                team1.text = array[0]
                team2.text = array[1]
                team3.text = array[2]
                team1.textColor = teams[0].color
                team2.textColor = teams[1].color
                team3.textColor = teams[2].color
            case 4:
                team1.text = array[0]
                team2.text = array[1]
                team3.text = array[2]
                team4.text = array[3]
                team1.textColor = teams[0].color
                team2.textColor = teams[1].color
                team3.textColor = teams[2].color
                team4.textColor = teams[3].color
            case 5:
                team1.text = array[0]
                team2.text = array[1]
                team3.text = array[2]
                team4.text = array[3]
                team5.text = array[4]
                team1.textColor = teams[0].color
                team2.textColor = teams[1].color
                team3.textColor = teams[2].color
                team4.textColor = teams[3].color
                team5.textColor = teams[4].color

            case 6:
                team1.text = array[0]
                team2.text = array[1]
                team3.text = array[2]
                team4.text = array[3]
                team5.text = array[4]
                team6.text = array[5]
                team1.textColor = teams[0].color
                team2.textColor = teams[1].color
                team3.textColor = teams[2].color
                team4.textColor = teams[3].color
                team5.textColor = teams[4].color
                team6.textColor = teams[5].color
            default:
                print("Ohhh fuck")
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
