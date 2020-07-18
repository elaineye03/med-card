//
//  SendMessageViewController.swift
//  MedCardDraft
//
//  Created by Elaine Ye on 12/28/19.
//  Copyright © 2019 Elaine Ye. All rights reserved.
//

import Foundation

import UIKit
import MessageUI

class SendMessageViewController: UIViewController,  MFMessageComposeViewControllerDelegate {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("2nd screen")
        displayMessageInterface()
        //makeACall()
        
    }
    
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    func displayMessageInterface() {
        let composeVC = MFMessageComposeViewController()
        composeVC.messageComposeDelegate = self
        
        // Configure the fields of the interface.
        composeVC.recipients = ["911"]
        composeVC.body = "I love Swift!"
        
        // Present the view controller modally.
        if MFMessageComposeViewController.canSendText() {
            self.present(composeVC, animated: true, completion: nil)
        } else {
            print("Can't send messages.")
        }
    }
    
    func makeACall() {
          
        if let url = URL(string: "tel://911") {
          UIApplication.shared.canOpenURL(url)
           if #available(iOS 10, *) {
               UIApplication.shared.open(url)
           } else {
               UIApplication.shared.openURL(url)
           }
       }
    }
}
