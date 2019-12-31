//
//  TextContactsViewController.swift
//  MedCardDraft
//
//  Created by Ealine Ye on 12/29/19.
//  Copyright © 2019 Elaine Ye. All rights reserved.
//

import MessageUI
import UIKit
import CoreLocation

class TextContactsViewController: UITableViewController,   MFMessageComposeViewControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource,  CLLocationManagerDelegate{
   
   let scrollView = UIScrollView()
   let locationManager = CLLocationManager()
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    
    var pickerDescripData: [String] = [String]()
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        pickerDescripData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDescripData[row]
    }
    
    //columns
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    var eContactsRows: [EmergencyContact] = []
    
    override func viewDidLoad() {
        for (contact) in MedicalCard.shared.eContact {
            
            
            eContactsRows.append(contact)
        }
        self.pickerOutlet.delegate = self
        self.pickerOutlet.dataSource = self
        
        pickerDescripData = ["Attack", "Medical Emergency", "Fire", "Robbery", "Shooting"]
        
        locationManager.requestAlwaysAuthorization()
        if CLLocationManager.locationServicesEnabled() {
              locationManager.delegate = self
              locationManager.desiredAccuracy = kCLLocationAccuracyBest
              locationManager.startUpdatingLocation()
        }
    }
    
    
    @IBOutlet weak var pickerOutlet: UIPickerView!
    @IBOutlet weak var contacted911: UISwitch!
    
    
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
            
        
        
            
            composeVC.body = myMessage()
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
    
    func myMessage() -> String{
        let selected = pickerDescripData[pickerOutlet.selectedRow(inComponent: 0)]
         var descripMsg = "It's " + MedicalCard.shared.Person!.Name + ". "
         if (selected == "Attack")
         {
             descripMsg += "I am under attack. "
         }
         else if (selected == "Medical Emergency")
         {
             descripMsg += "I have a medical emergency. "
         }
         else if(selected == "Fire")
         {
             descripMsg += "There is a fire. "
         }
         else if (selected == "Robbery")
         {
             descripMsg += "There is a robbery happening. "
         }
         else if (selected == "Shooting")
         {
             descripMsg += "There is a shooting happening. "
         }
         if (contacted911.isOn)
         {
             descripMsg += "I have already contacted 911. "
         }
         else
         {
            descripMsg += "I have not already contacted 911. "
         }
        descripMsg = descripMsg + "This is my location as of now: https://www.google.com/maps/place/" + "(" + MedicalCard.shared.Location!.x + "," +
                        MedicalCard.shared.Location!.y + ")"
        return descripMsg
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let location = locations.first {
            print(location.coordinate)
            MedicalCard.shared.Location!.x = String(format: "%f", location.coordinate.latitude)
            MedicalCard.shared.Location!.y = String(format: "%f", location.coordinate.longitude)
            
        }
        
    }
    
}
