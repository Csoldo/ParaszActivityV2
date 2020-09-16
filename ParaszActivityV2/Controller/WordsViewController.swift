//
//  WordsViewController.swift
//  ParaszActivityV2
//
//  Created by Nagy Boldizsár on 2020. 06. 15..
//  Copyright © 2020. Nagy Boldizsár. All rights reserved.
//

import UIKit

class WordsViewController: UIViewController {
    
    var brain : Brain?
    var teams = [Team]()
    var start = false
    var totalWords: Int?
    var currentWord = 0
    //var expressions = [String]()
    // Próba
    var expressions = ["Hugy", "Szar", "Fos", "Picsa", "Segg", "Fasz", "Pablo", "R3HAB", "Tesla", "Tyúkhúsleves", "Fos", "Utolsó"]
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.text = ""
        if let total = totalWords {
            progressLabel.text = "0/\(total)"
        }
    }
    @IBAction func sendPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToScore", sender: self)
        /*if canAppend(currentWords: currentWord) == true{
            if textField.text != "" {
                let text = textField.text!
                expressions.append(text)
                textField.text = ""
                currentWord += 1
                changeProgress()
            }else {
                print("fuck")
            }
            
        }
        if canAppend(currentWords: currentWord) == false{
            performSegue(withIdentifier: "goToScore", sender: self)
        }*/
        
        
    }
    func canAppend(currentWords: Int) -> Bool{
        if let total = totalWords {
            if (currentWords < total) {
                return true
            }else {
                return false
            }
        }else {
            return false
        }
    }
    func changeProgress() {
        if let total = totalWords {
            progressLabel.text = "\(currentWord)/\(total)"
            let progress = Float(currentWord) / Float(total)
            progressBar.progress = progress
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if (segue.identifier == "goToScore") {
        let destinationVC = segue.destination as! ScoreBoardViewController
        destinationVC.brain = brain
        destinationVC.teams = brain!.teams
        destinationVC.totalWords = totalWords
        destinationVC.expressions = expressions
        }
    }
}
