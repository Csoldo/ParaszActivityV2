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
    var expressions = [String]()
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let total = totalWords {
            progressLabel.text = "0/\(total)"
        }
    }
    @IBAction func sendPressed(_ sender: UIButton) {
        if let text = textField.text {
            if canAppend(currentWords: currentWord) {
                expressions.append(text)
                textField.text = ""
                currentWord += 1
            }
        }
        changeProgress()
        
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
}
