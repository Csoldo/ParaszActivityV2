//
//  Brain.swift
//  ParaszActivityV2
//
//  Created by Nagy Boldizsár on 2020. 06. 11..
//  Copyright © 2020. Nagy Boldizsár. All rights reserved.
//

import Foundation
import UIKit

class Brain {
    //var players = [String]()
    // Próba
    var players = ["Csarco", "Csoldo", "Csombék"]
    var teams = [Team]()
    var playersInTeam = 2
    var numberOfTeams = 2
    var canStart = false
    var teamCounter = 0
    var colors = Color()
    func assignPlayers(text: String?) -> String{
        if text != "" {
            let name = text!
            players.append(name)
        }
        return ""
    }
    func playersAreReady(numberOfPlayers: Int) -> Bool{
        if players.count == numberOfPlayers{
            canStart = true
            return true
        }
        else {
            return false
        }
    }
    
    func startGame(switchIsOn: Bool) {
        if switchIsOn == true {
            shuffle()
        }
        var x = 0
        var y = 0
        var i = 0
        var tmpPlayers = [Player]()
        while x < numberOfTeams {
            y = 0
            while y < playersInTeam {
                
                tmpPlayers.append(Player(name: players[i]))
                y += 1
                i += 1
            }
            teams.append(Team(players: tmpPlayers, color: colors.colors[x]))
            tmpPlayers.removeAll()
            x += 1
            
        }
        var ass = 0
        var asd = 1
        /*for team in teams {
            for player in team.players {
                //print("\(ass): \(player.name)")
                asd += 1
            }
            ass += 1
        }*/
    }
    
    func shuffle(){
        let x = players.count
        var i = 0
        while x > i {
            let rnd = Int.random(in: 0...players.count - 1)
            let tmp = players[i]
            players[i] = players[rnd]
            players[rnd] = tmp
            i += 1
        }
    }
    func writeNames(names: [String]) -> String {
        var newString = ""
        for name in names {
            newString.append(contentsOf: name)
            newString.append("\n")
        }
        return newString
    }
    
    func teamsToString(teams: [Team]) -> [String] {
        var stringArray = [String]()
        var i = 1
        for team in teams {
            var players = ""
            for player in team.players {
                players += "\n\(player.name)"
            }
            
            stringArray.append("Team \(i)\n\(players)")
            i += 1
        }
        return stringArray
    }
    
    func getTeams() -> [Team] {
        return self.teams
    }
    
    func getTotalPlayers() -> Int{
        return self.numberOfTeams * self.playersInTeam
    }
}
