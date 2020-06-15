//
//  ViewController.swift
//  ParaszActivityV2
//
//  Created by Nagy Boldizsár on 2020. 06. 07..
//  Copyright © 2020. Nagy Boldizsár. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var playerStepperLabel: UILabel!
    @IBOutlet weak var teamStepperLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var randomSwitch: UISwitch!
    @IBOutlet weak var namesLabel: UILabel!
    
    var brain = Brain()
    override func viewDidLoad() {
        super.viewDidLoad()
        namesLabel.text = ""
    }
    
    @IBAction func playerStepper(_ sender: UIStepper) {
        playerStepperLabel.text = String(format: "%.0f", sender.value)
        brain.playersInTeam = Int(sender.value)
        
    }
    @IBAction func teamStepper(_ sender: UIStepper) {
        teamStepperLabel.text = String(format: "%.0f", sender.value)
        brain.numberOfTeams = Int(sender.value)
        
    }
    @IBAction func startPressed(_ sender: UIButton) {
        if brain.canStart == true {
            let isRandomOn = randomSwitch.isOn
            brain.startGame(switchIsOn: isRandomOn)
        }else {
            //Not ready
        }
    }
    
    @IBAction func donePressed(_ sender: UIButton) {
        let totalPlayers = brain.numberOfTeams * brain.playersInTeam
        textField.text = brain.assignPlayers(text: textField.text)
        namesLabel.text = brain.writeNames(names: brain.players)
        if brain.playersAreReady(numberOfPlayers: totalPlayers) == false {
            textField.placeholder = "Write more names"
            
        }else {
            textField.text = "ready"
            startButton.backgroundColor = .green
            
        }
    }
    
    func goToWords() {
        
    }
}



