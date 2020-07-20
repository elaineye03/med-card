//
//  EULAViewController.swift
//  em-urgency
//
//  Created by Elaine Ye on 7/19/20.
//  Copyright © 2020 Elaine Ye. All rights reserved.
//

import UIKit

class EULAViewController: UIViewController {
    
    
   
    
    
    @IBAction func ButtonA(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
   // performSegue(withIdentifier: "AgreeSegue", sender: self)
    }
    
    
    
    
    
    @IBOutlet weak var TextView: UITextView!
    override func viewDidLoad(){
        super.viewDidLoad()
        print("dsf")
        TextView.text = """
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
//        let paragraphStyle = NSMutableParagraphStyle()
//        NSMutableParagraphStyle().lineSpacing = 15
//
//        let attributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.paragraphStyle: paragraphStyle]
//       let attributedString = NSAttributedString(string: TextView.text, attributes: attributes)
//
//
//        TextView.attributedText = attributedString
//        view.addSubview(TextView)
        
    }
    
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
    }
}
