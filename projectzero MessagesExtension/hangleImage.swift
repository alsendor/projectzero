//
//  hangleImage.swift
//  projectzero MessagesExtension
//
//  Created by Mario Ortega on 3/2/19.
//  Copyright © 2019 Alsendor Nucum. All rights reserved.
//

import Foundation
import UIKit

class handleImage: NSObject {
    static let common = handleImage()
    
    fileprivate var currentVC: UIViewController!
    
    // MARK:
    var imageBlock: ((UIImage) -> Void)?
    
    // Load Camera to take Picture
    func loadCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraController = UIImagePickerController()
            cameraController.delegate = (self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate);
            cameraController.sourceType = .camera
            currentVC.present(cameraController, animated: true, completion: nil)
        }
    }
    
    // Load Image from the library
    func loadFromLibrary() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let libraryController = UIImagePickerController()
            libraryController.delegate = (self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate);
            libraryController.sourceType = .photoLibrary
            currentVC.present(libraryController, animated: true, completion: nil)
        }
    }
    
    func showActionSheet(vc: UIViewController) {
        currentVC = vc
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        actionSheet.addAction(
            UIAlertAction(title: "Camera", style: .default, handler: {
                (alert:UIAlertAction!) -> Void in self.loadCamera()
            })
        )
    }
    
    
}