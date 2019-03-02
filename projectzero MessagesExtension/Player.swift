//
//  Player.swift
//  projectzero MessagesExtension
//
//  Created by Alsendor Nucum on 3/1/19.
//  Copyright © 2019 Alsendor Nucum. All rights reserved.
//

import Foundation

class Player {
    
    var name: String
    var id: Int
    var score: Int
    var king: Bool
    
    init(playerName: String) {
        self.name = playerName
        self.score = 0
        self.king = false //will start random king later
        self.id = 1 //will assign player ids later on
    }
    
    func isKing() -> Bool {
        return king
    }
    
    func setKing() {
        if king {
            king = false
        }
        else {
            king = true
        }
    }
    
    func choosePrompt() {
        
    }
    
    func chooseBestMeme() {
        
    }
    
}
