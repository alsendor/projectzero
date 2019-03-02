//
//  Game.swift
//  projectzero MessagesExtension
//
//  Created by Alsendor Nucum on 3/1/19.
//  Copyright © 2019 Alsendor Nucum. All rights reserved.
//

import Foundation
import Messages

enum GameState : Int {
    case menu = 1
    case kingsTurn = 2
    case jokersTurn = 3
}

class Game {
    
    var currentKing : Int
    var count : Int
    var players = [Player]() //Array of players in current session
    
    init() {
        currentKing = 1
        count = 0
    }
    
}
