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

class MessagesViewController: MSMessagesAppViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // Setting view picker
    //var imgPicker: UIPickerView = UIPickerView()
    
    @IBOutlet weak var imgPicker: UIPickerView!
    
    var setofImages = ["elmoWorldBurn", "spongeFishFam", "spongeFishDrinking", "planktonPlanning", "guyBlinkingMeme", "goodBurgeAww", "jimmyNeutronHamster", "bolbySlapSlapClapClap", "spongeFishEating", "kermitCry", "spongeFishSlurp", "patrickShook", "patrickLookingDown", "elmoShocked", "spidermanCarefullyHero", "squidwardWoke", "sixNineStoopid", "souljaBoyDrake", "bbqBeckyWhiteLady", "rollSafeThinkAboutIt", "pikachuSurprised", "spongeBobTired", "spongeBobMocking", "neilDeGrasseTyson", "elonMuskJoint", "gordonRamsayShocked"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("View Loaded")
    }
    
//    func addIntroPicker() {
//
//        imgPicker.delegate = self
//        imgPicker.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
//        self.view.addSubview(imgPicker)
//        imgPicker.backgroundColor = UIColor.clear
//    }
    
    // MARK: ----- Handle Picker views
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return setofImages.count
    }
    
//    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
//        let myLabelView =  UILabel()
//
//        myLabelView.text = setofImages[row]
//        print(setofImages[row])
//        myLabelView.adjustsFontSizeToFitWidth = true
//        myLabelView.font = UIFont(name: "Arial", size: 20)
//        myLabelView.textAlignment = .center
//
//        return myLabelView
//    }
    
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
        print("Recipent has recieved MEME")
        // Use this method to trigger UI updates in response to the message.
    }
    
    override func didStartSending(_ message: MSMessage, conversation: MSConversation) {
        // Called when the user taps the send button.
        print("Has Tapped Send")
    }
    
    override func didCancelSending(_ message: MSMessage, conversation: MSConversation) {
        // Called when the user deletes the message without sending it.
    
        // Use this to clean up state related to the deleted message.
        print("User deleted message")
    }
    
    override func willTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        // Called before the extension transitions to a new presentation style.
    
        // Use this method to prepare for the change in presentation style.
        print("Switching to presentationStyle(", presentationStyle.rawValue, ")")
    }
    
    override func didTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        // Called after the extension transitions to a new presentation style.
    
        // Use this method to finalize any behaviors associated with the change in presentation style.
        print("Successfully transitioned to presentationStyle(", presentationStyle.rawValue, ")")
    }
    
    @IBAction func startGameButton(_ sender: UIButton) {
        //print("Expanding view")
        let randomIndex = Int.random(in: 0 ... (setofImages.count))
        let myImage = UIImage(named: setofImages[randomIndex])
        
        guard
            let conversation = self.activeConversation
        else {
                fatalError("Expected a conversation")
        }
        let session = MSSession()
        
        let layout = MSMessageTemplateLayout()
        //layout.image = Play
        layout.image = myImage;
        layout.imageTitle = "What the Meme"
        layout.imageSubtitle = "Today's Meme"
        layout.caption = "Lets Play This Shit"
        
        let message = MSMessage(session: session)
        message.layout = layout
        message.summaryText = "Sent Message"
        conversation.insert(message)
        requestPresentationStyle(MSMessagesAppPresentationStyle.compact)
    }
    
    @IBAction func readyButton(_ sender: UIButton) {
        print("Readying up")
    }
    
    @IBAction func loadImageButton(_ sender: Any) {
        print("Expanding Presentation Style")
        requestPresentationStyle(MSMessagesAppPresentationStyle.expanded)
        
        //Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(self.addIntroPicker), userInfo: nil, repeats: false)
        //handleImage.shared.showActionSheet(vc: self)
        ////        handleImage.shared.chosenImage = {
        ////            handleImage.showActionSheet()
        ////
        ////        }
    }
    
    
    
    
    

}
