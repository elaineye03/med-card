//
//  Text911ViewController.swift
//  MedCardDraft
//
//  Created by Elaine Ye on 12/28/19.
//  Copyright © 2019 Elaine Ye. All rights reserved.
//

import Foundation
import MessageUI
import UIKit
import CoreLocation

class Text911ViewController : UIViewController,  MFMessageComposeViewControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource, CLLocationManagerDelegate{
    
    let scrollView = UIScrollView()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("2nd screen")
        
        self.descriptionPicker.delegate = self
        self.descriptionPicker.dataSource = self
        
        pickerDescripData = ["Attack", "Medical Emergency", "Fire", "Robbery", "Shooting"]
        
        locationManager.requestAlwaysAuthorization()
        if CLLocationManager.locationServicesEnabled() {
              locationManager.delegate = self
              locationManager.desiredAccuracy = kCLLocationAccuracyBest
              locationManager.startUpdatingLocation()
        }
        

        //displayMessageInterface()
        //makeACall()
        
        
        
        
        
    }
    @IBOutlet weak var descriptionPicker: UIPickerView!
    
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

    
    @IBOutlet weak var textedAlreadySwitch: UISwitch!
    @IBOutlet weak var ambulanceSwitch: UISwitch!
    @IBOutlet weak var policeSwitch: UISwitch!
    @IBOutlet weak var movingSwitch: UISwitch!
    
    @IBAction func submitFields(_ sender: UIButton) {
        let selected = pickerDescripData[descriptionPicker.selectedRow(inComponent: 0)]
        var descripMsg = "My name is " + MedicalCard.shared.Person!.Name + ". "
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
        
        if (ambulanceSwitch.isOn && policeSwitch.isOn)
        {
            descripMsg += "I need police and ambulance. "
        }
        else if(ambulanceSwitch.isOn && !policeSwitch.isOn)
        {
            descripMsg += "I need an ambulance. "
        }
        else if (!ambulanceSwitch.isOn && policeSwitch.isOn)
        {
            descripMsg += "I need the police. "
        }
        
        if (movingSwitch.isOn)
        {
            descripMsg += "I am in a moving vehicle. "
        }
        else
        {
            descripMsg += "I am not in a moving vehicle. "
        }
        
        if (textedAlreadySwitch.isOn)
        {
            descripMsg += "I have already texted 911. "
        }
        descripMsg = descripMsg + "This is my location as of now: https://www.google.com/maps/place/" + "(" + MedicalCard.shared.Location!.x + "," +
        MedicalCard.shared.Location!.y + ")"
       
        descripMsg += " This is my callback number: " + MedicalCard.shared.Person!.Phone

        displayMessageInterface(msg: descripMsg)
    }
    
    //composing msg
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true, completion: nil)
    }
    func displayMessageInterface(msg : String) {
        let composeVC = MFMessageComposeViewController()
        composeVC.messageComposeDelegate = self
        
        // Configure the fields of the interface.
        composeVC.recipients = ["911"]
        //composeVC.body = "I love Swift!"
        
        composeVC.body = msg
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
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let location = locations.first {
            print(location.coordinate)
            MedicalCard.shared.Location!.x = String(format: "%f", location.coordinate.latitude)
            MedicalCard.shared.Location!.y = String(format: "%f", location.coordinate.longitude)
            
        }
        
    }
    
}
