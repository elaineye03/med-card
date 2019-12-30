//
//  TextContactsViewController.swift
//  MedCardDraft
//
//  Created by Stanley Ye on 12/29/19.
//  Copyright © 2019 Elaine Ye. All rights reserved.
//

import UIKit
import MessageUI

class TextContactsViewController: UITableViewController,   MFMessageComposeViewControllerDelegate {
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    
    var eContactsRows: [EmergencyContact] = []
    
    override func viewDidLoad() {
        for (numcontact, contact) in MedicalCard.shared.eContact {
            print(numcontact)
            
            eContactsRows.append(contact)
        }
    }
    
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eContactsRows.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "ContactRowCell", for: indexPath)
         
        cell.textLabel!.text = eContactsRows[indexPath.row].Name
        cell.textLabel?.accessibilityLabel = String(indexPath.row)
        print(cell.textLabel!.text! + " " + cell.textLabel!.accessibilityLabel!)
         return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        displayMessageInterface(contact: eContactsRows[indexPath.row])
            

    }
    func displayMessageInterface(contact : EmergencyContact) {
            let composeVC = MFMessageComposeViewController()
            composeVC.messageComposeDelegate = self
            
            // Configure the fields of the interface.
            print(contact.Phone)
            composeVC.recipients = [contact.Phone]
            //composeVC.body = "I love Swift!"
            
            composeVC.body = ""
    //        let selected = pickerDescripData[descriptionPicker.selectedRow(inComponent: 0)]
    //        print(selected)
    //
            // Present the view controller modally.
            if MFMessageComposeViewController.canSendText() {
                self.present(composeVC, animated: true, completion: nil)
            } else {
                print("Can't send messages.")
            }
        }
    
}
