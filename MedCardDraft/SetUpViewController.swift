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
       medicalRows.remove(at: indexPath.row)
       medicalRows.remove(at: indexPath.row)
       medicalRows.remove(at: indexPath.row)
       medicalRows.remove(at: indexPath.row)
    
       // need to update eContactsIndex too
       //refresh screen
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
//        print(textField.text!)
//        print(textField.accessibilityIdentifier!)
        updateTextField(index: (textField.accessibilityIdentifier! as NSString).integerValue, text: textField.text!)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return medicalRows.count
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
        default:
            print("no matching")
        }
    
    }
    
    @IBOutlet weak var editOutlet: UIButton!
    @IBOutlet weak var addContactOutlet: UIButton!
    @IBOutlet weak var saveOutlet: UIButton!
    @IBAction func saveButton(_ sender: UIButton) {
        
        writeMedicalCardToPlist(card: MedicalCard.shared)
        
        enableEdit = false
        saveOutlet.isHidden = true
        refreshOutlet.isHidden = true
        addContactOutlet.isHidden = false
        editOutlet.isHidden = false
        
        medicalRows = MedicalCardRow.loadCardRows()
        self.tableView.reloadData()
    }
    
    
    @IBAction func editButton(_ sender: UIButton) {
        enableEdit = true
         self.tableView.reloadData()
        
        saveOutlet.isHidden = false
        refreshOutlet.isHidden = false
        addContactOutlet.isHidden = false
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
    
    @IBOutlet weak var refreshOutlet: UIButton!
    @IBAction func refreshButton(_ sender: UIButton) {

        medicalRows = MedicalCardRow.loadCardRows()
        self.tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        saveOutlet.isHidden = true
        refreshOutlet.isHidden = true
        addContactOutlet.isHidden = true
    }

    
}


