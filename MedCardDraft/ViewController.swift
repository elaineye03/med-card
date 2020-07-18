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
    static let PLIST_FILE_NAME = "test.plist"
    static let NINE_ONE_ONE_PHONE_NUMBER = "tel://911"
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func call911(_ sender: UIButton) {
        if let url = URL(string: ViewController.NINE_ONE_ONE_PHONE_NUMBER) {
           UIApplication.shared.canOpenURL(url)
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    @IBOutlet weak var text911Outlet: UIButton!
    @IBOutlet weak var medicalOutlet: UIButton!
    @IBOutlet weak var textContact: UIButton!
    @IBOutlet weak var call911Outlet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MedicalCard.shared = attemptToReadFromPlist()
        
         call911Outlet.layer.cornerRadius = 4
         text911Outlet.layer.cornerRadius = 4
        medicalOutlet.layer.cornerRadius = 4
        textContact.layer.cornerRadius = 4
        
        text911Outlet.titleLabel?.font = .systemFont(ofSize: 25)
        
    }
    
    func attemptToReadFromPlist() -> MedicalCard {
        
        var medicalCardInMemory = MedicalCard()
        guard
            let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent(ViewController.PLIST_FILE_NAME)
             else {
                fatalError("unable to get file")
             }
        
         print (fileURL)
      
        do {
             let plistXmlString  = try Data.init(contentsOf: fileURL)
             
             if let card = try? PropertyListDecoder().decode(MedicalCard.self, from: plistXmlString) {
                  print(card)
                return card
             }
              
         } catch {
            print(error)
            medicalCardInMemory = createInitialBlankCard()
            writeMedicalCardToPlist(card: medicalCardInMemory)
         }
       
        return medicalCardInMemory
    }

    func writeMedicalCardToPlist(card: MedicalCard) {
       let encoder = PropertyListEncoder()
       encoder.outputFormat = .xml

        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(ViewController.PLIST_FILE_NAME)
    
       do {
           let data = try encoder.encode(card)
           try data.write(to: path)
       } catch {
           print(error)
       }
    }
    
    func  createInitialBlankCard() -> MedicalCard {
        let personal  = Personal(Name: "", DOB: "", Gender: "", Address: "", Phone: "", Email: "", SSN: "")

       let insuranceDict: [String: String] = ["provider": "", "group": "", "policy": "", "InsuredName": ""]
       
       let medinfo =  MedicalInfo(Allergy: "", Condition: "", Medication: "", Insurance: insuranceDict, BloodType: "")
       
       let doctor = DrContact(Kind: "", Name: "", Phone: "", Email: "")
       
       let emergecontact = EmergencyContact(Name: "", Phone:"", Email: "", Relation:"")
       let earray = [emergecontact]
       let locat = Location(x: "0.0", y: "0.0")
       
       let card = MedicalCard(person: personal, medical: medinfo, doctor: doctor,emergency: earray, loc: locat)

       return card
    }
    
}

