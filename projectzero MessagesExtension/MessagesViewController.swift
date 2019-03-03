//
//  MessagesViewController.swift
//  projectzero MessagesExtension
//
//  Created by Alsendor Nucum on 3/1/19.
//  Copyright © 2019 Alsendor Nucum. All rights reserved.
//

import UIKit
import Messages

enum state: Int {
    case home = 1
    case kingsTurn = 2
    case jokersTurn = 3
    case end = 4
}

//Global variables for game
let maxPlayers = 8
var count : Int?
var currentKing = Int.random(in: 1..<count!)
var players = [Player]() //Array of players in current session
var usedMemes = [Meme]() // Array of memes that are used in current round

class MessagesViewController: MSMessagesAppViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("After Loading")
    }
    
    // MARK: - Conversation Handling
    
    override func willBecomeActive(with conversation: MSConversation) {
        // Called when the extension is about to move from the inactive to active state.
        // This will happen when the extension is about to present UI.
        print("Inactive -> Active")
        
        // Use this method to configure the extension and restore previously stored state.
    }
    
    override func didResignActive(with conversation: MSConversation) {
        // Called when the extension is about to move from the active to inactive state.
        // This will happen when the user dissmises the extension, changes to a different
        // conversation or quits Messages.
        print("Active -> Inactive")
        // Use this method to release shared resources, save user data, invalidate timers,
        // and store enough state information to restore your extension to its current state
        // in case it is terminated later.
    }
   
    override func didReceive(_ message: MSMessage, conversation: MSConversation) {
        // Called when a message arrives that was generated by another instance of this
        // extension on a remote device.
        print("Recieved a MEME Message")
        // Use this method to trigger UI updates in response to the message.
    }
    
    override func didStartSending(_ message: MSMessage, conversation: MSConversation) {
        // Called when the user taps the send button.
        print("User send MEME")
    }
    
    override func didCancelSending(_ message: MSMessage, conversation: MSConversation) {
        // Called when the user deletes the message without sending it.
    
        // Use this to clean up state related to the deleted message.
        print("User canceled MEME sending")
    }
    
    override func willTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        // Called before the extension transitions to a new presentation style.
    
        // Use this method to prepare for the change in presentation style.
        print("Switching to presentation style ", presentationStyle.rawValue)
    }
    
    override func didTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        // Called after the extension transitions to a new presentation style.
    
        // Use this method to finalize any behaviors associated with the change in presentation style.
        print("Successfully transitioned to style ", presentationStyle.rawValue)
    }
    
    @IBAction func startGameButton(_ sender: UIButton) {
        print("Expanding view")
        guard let conversation = self.activeConversation else { fatalError("Expected a conversation")}
        let session = MSSession()
        let layout = MSMessageTemplateLayout()
        //layout.image = Play
        layout.caption = "Lets Play This Shit"
        let message = MSMessage(session: session)
        message.layout = layout
        message.summaryText = "Sent Message"
        conversation.insert(message)
        //requestPresentationStyle(MSMessagesAppPresentationStyle.expanded)
    }
    
    @IBAction func readyButton(_ sender: UIButton) {
    print("Readying up")
    //        print("Opening Meme Menu")
            handleImage.shared.showActionSheet(vc: self)
    ////        handleImage.shared.imageBlock = {
    ////            handleImage.showActionSheet()
    ////
    ////        }
    }

}
