//
//  ViewController.swift
//  MedCardDraft
//
//  Created by Elaine Ye on 12/28/19.
//  Copyright © 2019 Elaine Ye. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController, MFMessageComposeViewControllerDelegate {
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func call911(_ sender: UIButton) {
        if let url = URL(string: "tel://14087288046") {
           UIApplication.shared.canOpenURL(url)
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let personal  = Personal(Name: "elaine ye", DOB: "12/27/18", Gender: "female", Address: "123 Street Avenue", Phone: "408-555-5555", Email: "email@gmail.com", SSN: "1234567890")

        var insuranceDict: [String: String] = ["provider": "asdf", "group": "asdfoj", "policy": "122333", "InsuredName": "elaine"]
        
        let medinfo =  MedicalInfo(Allergy: "nonewefijwaoefoiwafjwaoiefjwoa;ejfw;aoiefjwai;ojfwaifiawfjeiwa;f", Condition: "none", Medication: "none", Insurance: insuranceDict, BloodType: "AB")
        
        let doctor = DrContact(Kind: "Physician", Name: "Primrose Everdeen", Phone: "294-859-6078", Email: "primrose@disctrict12.com")
        
        let emergecontact = EmergencyContact(Name: "Harry Potter", Phone:"123-900-3333", Email: "harrypotter@hogwarts.com", Relation:"Friend")
        let emergecontact2 = EmergencyContact(Name: "Annabeth Chase", Phone:"906-278-5928", Email: "annabethchase@halfbloodcamp.com", Relation:"Friend")
        let edict = ["0": emergecontact, "1": emergecontact2]
        let locat = Location(x: "0.0", y: "0.0")
        
        let card = MedicalCard(person: personal, medical: medinfo, doctor: doctor,emergency: edict, loc: locat)
        //let card = MedicalCard()
        
        print(card)
        
        MedicalCard.shared = card
    }

    
}

