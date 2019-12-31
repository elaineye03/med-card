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
    }
 
    @IBAction func saveButton(_ sender: UIButton) {
        let newContact = EmergencyContact(Name: nameTextField.text!, Phone: phoneTextField.text!, Email: emailTextField.text!, Relation: relationTextField.text!)
        MedicalCard.shared.eContact.append(newContact)
        self.navigationController?.popViewController(animated: true)
    }
}
