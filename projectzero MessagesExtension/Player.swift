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
        self.id = count!
        if (self.id == currentKing){
            self.king = true
            usedMemes.removeAll() // Removes all memes from usedMemes to start new round
        }else{
            self.king = false
        }
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
    
    func choosePrompt(chosenPrompt: Prompt) {
        if (self.king){
            chosenPrompt.setUsed()
        }
    }
    
    func chooseBestMeme(chosenMeme: Meme) {
        if (self.king){
            chosenMeme.setWinner()
        }
    }
    
    func chooseMeme(chosenMeme: Meme) {
        if (!self.king){
            usedMemes.append(chosenMeme)
        }
    }
    
}
