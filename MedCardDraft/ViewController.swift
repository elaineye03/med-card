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

       License

       I, the programmer, grant you a revocable, non-exclusive, non-transferable, limited license to download, install and use the Application solely for your personal, non-commercial purposes strictly in accordance with the terms of this Agreement.

       Restrictions

       You agree not to, and you will not permit others to:

       a) license, sell, rent, lease, assign, distribute, transmit, host, outsource, disclose or otherwise commercially exploit the Application or make the Application available to any third party.


       Modifications to Application

       I  reserve the right to modify, suspend or discontinue, temporarily or permanently, the Application or any service to which it connects, with or without notice and without liability to you.


       Term and Termination

       This Agreement shall remain in effect until terminated by you or me, the programmer.

       I may, in its sole discretion, at any time and for any or no reason, suspend or terminate this Agreement with or without prior notice.

       This Agreement will terminate immediately, without prior notice from me, in the event that you fail to comply with any provision of this Agreement. You may also terminate this Agreement by deleting the Application and all copies thereof from your mobile device or from your desktop.

       Upon termination of this Agreement, you shall cease all use of the Application and delete all copies of the Application from your mobile device or from your desktop.

       Severability

       If any provision of this Agreement is held to be unenforceable or invalid, such provision will be changed and interpreted to accomplish the objectives of such provision to the greatest extent possible under applicable law and the remaining provisions will continue in full force and effect.

       Amendments to this Agreement

       I reserve the right, at its sole discretion, to modify or replace this Agreement at any time. If a revision is material we will provide at least 30 days' notice prior to any new terms taking effect. What constitutes a material change will be determined at our sole discretion.

       Service Features

       Emergency Responders  If you use our Service, you understand and agree that once the content of your Medical Card is made available to Emergency Responders, it may be transmitted or otherwise made accessible through unsecured communications as part of the information disseminated to or by Emergency Responders responding to an emergency. You further understand that the content of your Medical Card may be stored as part of a public record associated with an emergency call if required by local statutes. You understand and agree and hereby authorize EM-URGENCY to release and disclose your Medical Card information to Emergency Responders in connection with the Service. You should only provide the information that you want Emergency Responders to have access to.  ‍ Location Information  ‍The Service includes location information features that collect and share location information about you. These features may not work for certain reasons, such as if the device and corresponding settings to allow the collection and sharing of location information are not enabled or if the device does not have a cellphone wireless service. If you use features designed to collect and share location information, the Service will access and collect information about your device and location during use of the app. By using the features designed to collect and share information, you represent and warrant that you have consented to use the Service and to allow it to access and collect such information.

       Software
       The application’s software may contain portions of software being the sole property of third parties. Such software is provided subject to the terms and conditions of the third party. Third party software used in connection with the service may include, but is not limited to:
       Apple API(Core location): You agree and understand that by using em-urgency, you agree to be bound by Apple’s terms of use available at https://developer.apple.com/terms/ and Apple’s privacy policy, as amended by Apple from time to time, currently available at https://www.apple.com/legal/privacy/en-ww/.
       By accessing or using this application, you hereby give your consent that em-urgency can track your location.
       I reserve any and all rights, implied or otherwise, which are not expressly granted to you hereunder, and retain all rights, title and interest in and to em-urgency’s software.


       Disclaimer

        THE SERVICE IS PROVIDED ON AN “AS IS” AND “AS AVAILABLE” BASIS. USE OF THE SERVICE IS AT YOUR OWN RISK. TO THE MAXIMUM EXTENT PERMITTED BY APPLICABLE LAW, THE SERVICE IS PROVIDED WITHOUT WARRANTIES OF ANY KIND, WHETHER EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, PRIVACY, SECURITY, ACCURACY, TIMELINESS, QUALITY, OR NON-INFRINGEMENT. NO ADVICE OR INFORMATION, WHETHER ORAL OR WRITTEN, OBTAINED BY YOU FROM EM-URGENCY OR THROUGH THE SERVICE WILL CREATE ANY WARRANTY NOT EXPRESSLY STATED HEREIN. WITHOUT LIMITING THE FOREGOING, EM-URGENCY AND ITS LICENSORS DO NOT WARRANT THAT: (I) THE SERVICE OR RESULTS THAT ARE OBTAINED FROM USE OF THE SERVICE (E.G., DATA, INFORMATION, LOCATION, CRASH DETECTION OR REPORTING, EMERGENCY ASSISTANCE, ETC.) WILL BE ACCURATE, RELIABLE, ERROR-FREE, OR CORRECT; (II) THE SERVICE OR RESULTS THAT ARE OBTAINED FROM USE OF THE SERVICE WILL MEET YOUR REQUIREMENTS; (III) THE SERVICE WILL BE AVAILABLE AT ANY PARTICULAR TIME OR LOCATION, TIMELY, UNINTERRUPTED, OR SECURE; (IV) ANY DEFECTS OR ERRORS WILL BE CORRECTED; OR (V)THE SERVICE IS FREE OF VIRUSES OR OTHER HARMFUL COMPONENTS. ANY CONTENT DOWNLOADED OR OTHERWISE OBTAINED THROUGH THE USE OF THE SERVICE IS DOWNLOADED AT YOUR OWN RISK AND YOU WILL BE SOLELY RESPONSIBLE FOR ANY DAMAGE TO YOUR COMPUTER SYSTEM OR MOBILE DEVICE OR LOSS OF DATA THAT RESULTS FROM SUCH DOWNLOAD OR YOUR USE OF THE SERVICE. 
       EM-URGENCY  DOES NOT WARRANT, ENDORSE, GUARANTEE, OR ASSUME RESPONSIBILITY FOR ANY PRODUCT OR SERVICE ADVERTISED OR OFFERED BY A THIRD PARTY THROUGH THE SERVICE OR ANY HYPERLINKED WEBSITE OR SERVICE, AND EM-URGENCY WILL NOT BE A PARTY TO OR IN ANY WAY MONITOR ANY TRANSACTION BETWEEN YOU AND THIRD-PARTY PROVIDERS OF PRODUCTS OR SERVICES.

        Limitation of Liability

       TO THE MAXIMUM EXTENT PERMITTED BY APPLICABLE LAW, IN NO EVENT SHALL THE EM-URGENCY ENTITIES OR ITS LICENSORS BE LIABLE FOR ANY DIRECT, INDIRECT, PUNITIVE, INCIDENTAL, SPECIAL, CONSEQUENTIAL, OR EXEMPLARY DAMAGES, INCLUDING WITHOUT LIMITATION DAMAGES FOR LOSS OF PROFITS, GOODWILL, USE, DATA, OR OTHER INTANGIBLE LOSSES, INCURRED BY YOU OR ANY THIRD PARTY, WHETHER IN AN ACTION IN CONTRACT OR TORT, ARISING FROM THE USE OF, OR INABILITY TO USE, THE SERVICE, EVEN IF EM-URGENCY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES OR LOSSES.  NOTWITHSTANDING THE FOREGOING, THE TOTAL LIABILITY OF THE EM-URGENCY ENTITIES AND ITS LICENSORS, WHETHER IN CONTRACT, WARRANTY, TORT (INCLUDING, WITHOUT LIMITATION, NEGLIGENCE), PRODUCT LIABILITY, STRICT LIABILITY, OR ANY OTHER THEORY, ASSOCIATED WITH ANY CLAIM ARISING OUT OF OR RELATING TO USE OF OR ACCESS TO THE SERVICE FOR ANY REASON WHATSOEVER SHALL BE LIMITED TO ONE HUNDRED DOLLARS ($100).  IF THE JURISDICTION YOU ARE IN DOES NOT ALLOW FOR THE EXCLUSION OF CERTAIN TYPES OF DAMAGES, THEN SOME OF THE ABOVE LIMITATIONS MAY NOT APPLY TO YOU IN CERTAIN CIRCUMSTANCES.


       Contact Information

       If you have any questions about this Agreement, please contact us at tomedcard@gmail.com.


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

