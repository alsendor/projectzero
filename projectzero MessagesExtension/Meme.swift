//
//  Meme.swift
//  projectzero MessagesExtension
//
//  Created by Alsendor Nucum on 3/1/19.
//  Copyright © 2019 Alsendor Nucum. All rights reserved.
//

import Foundation

class Prompt {
    
    var prompt: String
    var used: Bool
    var memeList = [Meme]()
    
    init() {
        prompt = " "
        used = false
    }
    
    func getMemes() -> [Meme] {
        return memeList
    }
    
    func setUsed() {
        used = true
    }
    
}

class Meme {
    
}
