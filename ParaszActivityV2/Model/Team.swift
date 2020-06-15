//
//  Team.swift
//  ParaszActivityV2
//
//  Created by Nagy Boldizsár on 2020. 06. 10..
//  Copyright © 2020. Nagy Boldizsár. All rights reserved.
//

import Foundation

struct Team {
    let score = 0
    var players = [Player]()
    
    func printPlayers() {
        for player in players {
            print(player.name)
        }
    }
}
