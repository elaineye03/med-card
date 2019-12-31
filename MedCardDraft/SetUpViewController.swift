//
//  ViewController.swift
//  card-storage
//
//  Created by Elaine Ye on 12/26/19.
//  Copyright © 2019 Elaine Ye. All rights reserved.
//

import UIKit

class SetUpViewController: UITableViewController {
    
     var medicalRows: [MedicalCardRow] = []
     var enableEdit = false
     var eContactsIndex: [Int] = []
     var isContactSection:Bool = false
    
    var maxLoadedRow: Int = 0
    
    override func awakeFromNib() {
      super.awakeFromNib()
      
      medicalRows = MedicalCardRow.loadCardRows()
        
    }
    

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return eContactsIndex.contains(indexPath.row)
    }

    override func tableView(_ tableView: UITableView, commit style: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        var i = (indexPath.row-23)/4
        MedicalCard.shared.eContact.remove(at: i)
       medicalRows.remove(at: indexPath.row)
       medicalRows.remove(at: indexPath.row)
       medicalRows.remove(at: indexPath.row)
       medicalRows.remove(at: indexPath.row)
    
       // need to update eContactsIndex too
       self.tableView.reloadData()
       // need to remove it from MedicalCard object too
        
        
       updateEContactsIndex(pos: indexPath.row)
   }
    
    func updateEContactsIndex(pos: Int) {
        for (index, element) in eContactsIndex.enumerated() {
            if (element == pos) {
                eContactsIndex.remove(at: index)
                break
            }
        }
        
        for (index, element) in eContactsIndex.enumerated() {
            if (element > pos) {
                eContactsIndex[index] = element - 4
            }
        }
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        updateTextField(index: Int(textField.accessibilityIdentifier!)!, text: textField.text!)
        //updateTextField(index: (textField.accessibilityIdentifier! as NSString).integerValue, text: textField.text!)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return medicalRows.count
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        medicalRows = MedicalCardRow.loadCardRows()
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "MedicalCardRowCell", for: indexPath) as! MedicalCardRowCell
      let medicalRow = medicalRows[indexPath.row]
      cell.keyLabel.text = medicalRow.key

        //print(medicalRow.value + " key: " + medicalRow.key)

        if (medicalRow.value == "(TITLE)")
        {
            cell.valueTextField.isHidden = true
            if (medicalRow.key == "Contacts") {
                isContactSection = true
            } else {
                isContactSection = false
            }
        }
        else
        {
            cell.valueTextField.text = medicalRow.value
            cell.valueTextField.isEnabled = enableEdit
            cell.valueTextField.isHidden = false
            
            if (isContactSection == true && medicalRow.key == "Name") {
                eContactsIndex.append(indexPath.row)
            }
            
            cell.valueTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
            cell.valueTextField.accessibilityIdentifier = String(indexPath.row)
        }
   
     //   cell.thumbnailImageView.image = UIImage(named: vacationSpot.thumbnailName)
      
      return cell
    }
    
    func updateTextField(index: Int, text: String) {
        switch index {
        case 1:
            MedicalCard.shared.Person!.Name = text
        case 2:
            MedicalCard.shared.Person!.DOB = text
        case 3:
            MedicalCard.shared.Person!.Gender = text
        case 4:
            MedicalCard.shared.Person!.Address = text
        case 5:
            MedicalCard.shared.Person!.Phone = text
        case 6:
            MedicalCard.shared.Person!.Email = text
        case 7:
            MedicalCard.shared.Person!.SSN = text
        case 9:
            MedicalCard.shared.Medinfo!.Allergy = text
        case 10:
            MedicalCard.shared.Medinfo!.Medication = text
        case 11:
            MedicalCard.shared.Medinfo!.Condition = text
        case 12:
            MedicalCard.shared.Medinfo!.BloodType = text
        case 14:
             MedicalCard.shared.Medinfo!.Insurance["provider"] = text
        case 15:
            MedicalCard.shared.Medinfo!.Insurance["group"] = text
        case 16:
            MedicalCard.shared.Medinfo!.Insurance["policy"] = text
        case 17:
            MedicalCard.shared.Medinfo!.Insurance["InsuredName"] = text
        case 19:
            MedicalCard.shared.dContact!.Name = text
        case 20:
            MedicalCard.shared.dContact!.Phone = text
        case 21:
            MedicalCard.shared.dContact!.Email = text
        case 22:
            MedicalCard.shared.dContact!.Phone = text
        case 23...tableView.numberOfRows(inSection: 0):
            let i = (index-23) / 4
            let r = (index-23) % 4
            if (r == 1)
            {
                MedicalCard.shared.eContact[i].Name = text
            }
            else if(r == 2)
            {
                MedicalCard.shared.eContact[i].Phone = text
            }
            else if(r == 3)
            {
                MedicalCard.shared.eContact[i].Email = text
            }
            else if (r == 4)
            {
                MedicalCard.shared.eContact[i].Relation = text
            }
            
        default:
            print("no matching")
        }
    
    }
    
    @IBOutlet weak var editOutlet: UIButton!
    @IBOutlet weak var addContactOutlet: UIButton!
    @IBOutlet weak var saveOutlet: UIButton!
    @IBAction func saveButton(_ sender: UIButton) {
        saveOutlet.isHidden = true
        
        editOutlet.isHidden = false
        addContactOutlet.isHidden = true
        
//        let encoder = PropertyListEncoder()
//                encoder.outputFormat = .xml
//
//        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("medicalcard.plist")
//                print(path.absoluteString)
        // adding personal info
//        do {
//            let data = try encoder.encode(MedicalCard.shared.Person)
//            try data.write(to: path)
//        } catch {
//            print(error)
//            print ( " error from writing into")
//        }
//
//        do {
//            let data = try encoder.encode(MedicalCard.shared.Medinfo)
//            try data.write(to: path)
//        } catch {
//            print(error)
//            print ( " error from writing into")
//        }
//
//        do {
//            let data = try encoder.encode(MedicalCard.shared.eContact)
//            try data.write(to: path)
//        } catch {
//            print(error)
//            print ( " error from writing into")
//        }
//
//        do {
//            let data = try encoder.encode(MedicalCard.shared.dContact)
//            try data.write(to: path)
//        } catch {
//            print(error)
//            print ( " error from writing into")
//        }

        writeMedicalCardToPlist(card: MedicalCard.shared)
        
        enableEdit = false
        saveOutlet.isHidden = true
        
        addContactOutlet.isHidden = false
        editOutlet.isHidden = false

        
        medicalRows = MedicalCardRow.loadCardRows()
        self.tableView.reloadData()
    }
    
    
    @IBAction func editButton(_ sender: UIButton) {
        enableEdit = true
         self.tableView.reloadData()
        
        saveOutlet.isHidden = false
        
        addContactOutlet.isHidden = true
        editOutlet.isHidden = true
        
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
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        saveOutlet.isHidden = true
        
        addContactOutlet.isHidden = false
        
        
    }

    
}


