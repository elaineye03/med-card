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
    
        let userLicenseAgreement  =
    """
       THIS END USER LICENSE AGREEMENT (“EULA”) IS A LEGAL AGREEMENT BETWEEN YOU AND em-urgency(“WE”, “US”, OR “em-urgency”) REGARDING YOUR USE OF THE em-urgency APP (THE “LICENSED APPLICATION”).  BY USING THE LICENSED APPLICATION, YOU AGREE TO BE BOUND BY THE TERMS OF THIS EULA.  IF YOU DO NOT AGREE TO THE TERMS OF THIS EULA, YOU ARE NOT ENTITLED TO USE THE LICENSED APPLICATION AND MUST DE-INSTALL THE LICENSED APPLICATION FROM ALL OF YOUR DEVICES.
        
       Last updated: 7/19/20
        
       Please read this End-User License Agreement carefully before clicking the "I Agree" button, downloading or using em-urgency Application.
        
       By clicking the "I Agree" button, downloading or using the Application, you are agreeing to be bound by the terms and conditions of this Agreement.
        
       If you do not agree to the terms of this Agreement, do not click on the "I Agree" button and do not download or use the Application.
        
       License: I grant you a revocable, non-exclusive, non-transferable, limited license to download, install and use the Application solely for your personal, non-commercial purposes strictly in accordance with the terms of this Agreement.
        
       Restrictions

       You agree not to, and you will not permit others to:
        
       a) license, sell, rent, lease, assign, distribute, transmit, host, outsource, disclose or otherwise commercially exploit the Application or make the Application available to any third party.
        
        
       Modifications to Application
        
       I  reserve the right to modify, suspend or discontinue, temporarily or permanently, the Application or any service to which it connects, with or without notice and without liability to you.
        
        
       Term and Termination
        
       This Agreement shall remain in effect until terminated by you or em-urgency, my company.
        
       I may, in its sole discretion, at any time and for any or no reason, suspend or terminate this Agreement with or without prior notice.
        
       This Agreement will terminate immediately, without prior notice from me, in the event that you fail to comply with any provision of this Agreement. You may also terminate this Agreement by deleting the Application and all copies thereof from your mobile device or from your desktop.
        
       Upon termination of this Agreement, you shall cease all use of the Application and delete all copies of the Application from your mobile device or from your desktop.
        
       Severability
        
       If any provision of this Agreement is held to be unenforceable or invalid, such provision will be changed and interpreted to accomplish the objectives of such provision to the greatest extent possible under applicable law and the remaining provisions will continue in full force and effect.
        
       Amendments to this Agreement
        
       I reserve the right, at its sole discretion, to modify or replace this Agreement at any time. If a revision is material we will provide at least 30 days' notice prior to any new terms taking effect. What constitutes a material change will be determined at our sole discretion.
        
       Warranties
        
       1. You acknowledge and agree that the application does not replace proper supervision of yourself or others in need. The application is only an aid mechanism.
        
       2. em-urgency does not guarantee that people in need will get the help they need. I will not provide any services or assistance whatsoever in respect of helping people in need that go further than the app.
        
       3. The application is only intended for emergency situations when internet connection is available. You acknowledge and agree that other factors and circumstances outside of my control might cause disturbances in the functioning of the application and you acknowledge and agree that the use of the product shall be at your sole risk and responsibility.
        
       4. We reserve the right to improve and change the application and any element thereof at any time, at our sole discretion.
        
       Software
       1.    The application’s software may contain portions of software being the sole property of third parties. Such software is provided subject to the terms and conditions of the third party. Third party software used in connection with the service may include, but is not limited to:
       ·         Apple API(Core location): You agree and understand that by using em-urgency, you agree to be bound by Apple’s terms of use available at https://developer.apple.com/terms/ and Apple’s privacy policy, as amended by Apple from time to time, currently available at https://www.apple.com/legal/privacy/en-ww/.
       o   By accessing or using this application, you hereby give your consent that em-urgency can track your location.
       2.    I reserve any and all rights, implied or otherwise, which are not expressly granted to you hereunder, and retain all rights, title and interest in and to em-urgency’s software.
        
       Contact Information
        
       If you have any questions about this Agreement, please contact us at tomedcard@gmail.com
        
    """
  
    @IBAction func EULAbar(_ sender: UIButton) {
        self.performSegue(withIdentifier: "EULASegue", sender: self)
    }
    
   
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
    
    
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
        override func viewDidAppear(_ animated: Bool) {
             if(!appDelegate.hasAlreadyLaunched){
             
                  //set hasAlreadyLaunched to false
                  appDelegate.sethasAlreadyLaunched()
        //display user agreement license
                displayLicenAgreement(message: self.userLicenseAgreement)
            }
    }
    
    func displayLicenAgreement(message: String){
//        let storyBoard: UIStoryboard = UIStoryboard(name: "MedCard", bundle: nil)
//        let eulaViewController = storyBoard.instantiateViewController(withIdentifier: "eula")
//        print("hi")
//        self.present(eulaViewController, animated:true, completion: nil)
        //create alert
        let alert = UIAlertController(title: "License Agreement", message: message, preferredStyle: .alert)
        
        //create Decline button
        
        
        //create Accept button
        let acceptAction = UIAlertAction(title: "Accept", style: .default) { (action) -> Void in
            //ACCEPT LOGIC GOES HERE
        }
        
        //add task to tableview buttons
        
        alert.addAction(acceptAction)
        
        
        self.present(alert, animated: true, completion: nil)
    }

}

