//
//  Team.swift
//  ParaszActivityV2
//
//  Created by Nagy Boldizsár on 2020. 06. 10..
//  Copyright © 2020. Nagy Boldizsár. All rights reserved.
//

import UIKit

struct Team {
    let score = 0
    var players = [Player]()
    var color : UIColor
    var currentPlayer = 0
    func printPlayers() {
        for player in players {
            print(player.name)
        }
    }
    
}
