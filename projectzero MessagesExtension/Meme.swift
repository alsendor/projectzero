//
//  Meme.swift
//  projectzero MessagesExtension
//
//  Created by Alsendor Nucum on 3/1/19.
//  Copyright © 2019 Alsendor Nucum. All rights reserved.
//

import Foundation

class Prompt {
    
    var promptID: Int?
    var prompt: String
    var used: Bool
    var promptList = [Prompt]()

    
    init() {
        prompt = " "
        used = false
    }
    
    func getPrompts() -> [Prompt] {
        return promptList
    }
    
    func setUsed() {
        used = true
    }
        
}

class Meme {
    
    var memeID: Int?
    var memeText: String
    var used: Bool
    var winner: Bool
    var memeList = [Meme]()
    
    init() {
        memeText = ""
        used = false
        winner = false
    }
    
    func getMemes() -> [Meme] {
        return memeList
    }
    
    func setMessage(input: String){
        memeText = input
    }
    
    func setUsed() {
        used = true
    }
    
    func setWinner() {
        winner = true
    }
}
