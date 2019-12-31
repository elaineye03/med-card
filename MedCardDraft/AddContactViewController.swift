//
//  AddContactViewController.swift
//  MedCardDraft
//
//  Created by Elaine Ye on 12/29/19.
//  Copyright © 2019 Elaine Ye. All rights reserved.
//

import Foundation
import UIKit

class AddContactViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var relationTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.font = UIFont(name: nameTextField.font!.fontName, size: 25)
        phoneTextField.font = UIFont(name: phoneTextField.font!.fontName, size: 25)
        emailTextField.font = UIFont(name: emailTextField.font!.fontName, size: 25)
        relationTextField.font = UIFont(name: relationTextField.font!.fontName, size: 25)
    }
    
 
    @IBAction func saveButton(_ sender: UIButton) {
        let newContact = EmergencyContact(Name: nameTextField.text!, Phone: phoneTextField.text!, Email: emailTextField.text!, Relation: relationTextField.text!)
        let numitems = (MedicalCard.shared.eContact.count)
        MedicalCard.shared.eContact.append(newContact)
        for (contact) in MedicalCard.shared.eContact {
            
            print(contact.Name)
            print(contact.Phone)
            print(contact.Email)
            print( contact.Relation)
            print( " ")
        }
    }

    
   
    
}
