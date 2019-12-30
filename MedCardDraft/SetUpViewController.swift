//
//  ViewController.swift
//  card-storage
//
//  Created by Stanley Ye on 12/26/19.
//  Copyright © 2019 Stanley Ye. All rights reserved.
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
      
      medicalRows = MedicalCardRow.loadCardRowsFromPlist("mid")
        
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
        print(textField.text!)
        print(textField.accessibilityIdentifier!)
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
    
    @IBOutlet weak var editOutlet: UIButton!
    @IBOutlet weak var addContactOutlet: UIButton!
    @IBOutlet weak var saveOutlet: UIButton!
    @IBAction func saveButton(_ sender: UIButton) {
        let updatedPersonNameRow = tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as! MedicalCardRowCell
        MedicalCard.shared.Person!.Name = updatedPersonNameRow.valueTextField.text!
        
        let updatedPersonDOBRow = tableView.cellForRow(at: IndexPath(row: 2, section: 0)) as! MedicalCardRowCell
        MedicalCard.shared.Person!.DOB = updatedPersonDOBRow.valueTextField.text!
        
        let updatedPersonGenderRow = tableView.cellForRow(at: IndexPath(row: 3, section: 0)) as! MedicalCardRowCell
        MedicalCard.shared.Person!.Gender = updatedPersonGenderRow.valueTextField.text!
        
        let updatedPersonAddressRow = tableView.cellForRow(at: IndexPath(row: 4, section: 0)) as! MedicalCardRowCell
        MedicalCard.shared.Person!.Address = updatedPersonAddressRow.valueTextField.text!
        
        let updatedPersonPhoneRow = tableView.cellForRow(at: IndexPath(row: 5, section: 0)) as! MedicalCardRowCell
        MedicalCard.shared.Person!.Phone = updatedPersonPhoneRow.valueTextField.text!
        
        let updatedPersonEmailRow = tableView.cellForRow(at: IndexPath(row: 6, section: 0)) as! MedicalCardRowCell
        MedicalCard.shared.Person!.Email = updatedPersonEmailRow.valueTextField.text!
        
        let updatedPersonSSNRow = tableView.cellForRow(at: IndexPath(row: 7, section: 0)) as! MedicalCardRowCell
        MedicalCard.shared.Person!.SSN = updatedPersonSSNRow.valueTextField.text!
        
        let updatedAllergyRow = tableView.cellForRow(at: IndexPath(row: 9, section: 0)) as! MedicalCardRowCell
        MedicalCard.shared.Medinfo!.Allergy = updatedAllergyRow.valueTextField.text!
        
        let updatedMedicationRow = tableView.cellForRow(at: IndexPath(row: 10, section: 0)) as! MedicalCardRowCell
        MedicalCard.shared.Medinfo!.Medication = updatedMedicationRow.valueTextField.text!
        
        let updatedConditionRow = tableView.cellForRow(at: IndexPath(row: 11, section: 0)) as! MedicalCardRowCell
        MedicalCard.shared.Medinfo!.Condition = updatedConditionRow.valueTextField.text!
        
        let updatedBloodTypeRow = tableView.cellForRow(at: IndexPath(row: 12, section: 0)) as! MedicalCardRowCell
        MedicalCard.shared.Medinfo!.BloodType = updatedBloodTypeRow.valueTextField.text!
        
        let updatedProviderRow = tableView.cellForRow(at: IndexPath(row: 14, section: 0)) as! MedicalCardRowCell
        print(updatedBloodTypeRow.valueTextField.text!)
        MedicalCard.shared.Medinfo!.Insurance["provider"] = updatedBloodTypeRow.valueTextField.text!
        
        let updatedGroupRow = tableView.cellForRow(at: IndexPath(row: 15, section: 0)) as! MedicalCardRowCell
        MedicalCard.shared.Medinfo!.Insurance["group"] = updatedGroupRow.valueTextField.text!
        
        let updatedPolicyRow = tableView.cellForRow(at: IndexPath(row: 16, section: 0)) as! MedicalCardRowCell
        MedicalCard.shared.Medinfo!.Insurance["policy"] = updatedPolicyRow.valueTextField.text!
        
        let updatedInsuredNameRow = tableView.cellForRow(at: IndexPath(row: 17, section: 0)) as! MedicalCardRowCell
        MedicalCard.shared.Medinfo!.Insurance["InsuredName"] = updatedInsuredNameRow.valueTextField.text!
        
        
        
        //print(updatedMedicalRow.valueTextField.text!)
    }
    
    
    @IBAction func editButton(_ sender: UIButton) {
        enableEdit = true
         self.tableView.reloadData()
        
        saveOutlet.isHidden = false
        refreshOutlet.isHidden = false
        addContactOutlet.isHidden = false
        editOutlet.isHidden = true
        
    }
    @IBOutlet weak var refreshOutlet: UIButton!
    @IBAction func refreshButton(_ sender: UIButton) {
//        self.tableView.currentIndexPath = NSIndexPath(forRow: 0, inSection: 0)
        medicalRows = MedicalCardRow.loadCardRowsFromPlist("mid")
        self.tableView.reloadData()
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        saveOutlet.isHidden = true
        refreshOutlet.isHidden = true
        addContactOutlet.isHidden = true
        
        
       // medicalRows = MedicalCardRow.loadCardRowsFromPlist("mid")
        

        
//        let label = UILabel(frame: CGRect(x:0, y:0, width: 200, height:21))
//        label.textAlignment = .center
//        label.text = "I'm a test label"
//        label.sizeToFit()
//        self.view.addSubview(label)
    }
//          scrollView = UIScrollView(frame: view.bounds)
//          scrollView.backgroundColor = UIColor.white
//          scrollView.contentSize = stackView.bounds.size
//          scrollView.autoresizingMask = UIView.AutoresizingMask(rawValue: UIView.AutoresizingMask.flexibleWidth.rawValue | UIView.AutoresizingMask.flexibleHeight.rawValue)
              
        
         // by default scrollView.contentOffset = CGPoint(x: 1000, y: 450)
//        self.view.backgroundColor = UIColor.gray
        
//        scrollView.addSubview(stackView)
//         scrollView.delegate = self.view
//         scrollView.minimumZoomScale = 0.1
//         scrollView.maximumZoomScale = 4.0
//         scrollView.zoomScale = 1.0
        

    
//    func addScrollView() {
////        scrollView = UIScrollView(frame: view.bounds)
////        stackView = UIStackView()
//
//        self.view.backgroundColor = UIColor.gray
//
//        self.view.addSubview(self.scrollView)
//
//         self.scrollView.translatesAutoresizingMaskIntoConstraints = false;
//
//         //Constrain scroll view
//         self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true;
//         self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20).isActive = true;
//         self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true;
//         self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20).isActive = true;
//
//
//         //Add and setup stack view
//        self.scrollView.addSubview(self.stackView)
//        self.stackView.translatesAutoresizingMaskIntoConstraints = false
//        self.stackView.axis = .vertical
//        self.stackView.spacing = 10;
//
//        //constrain stack view to scroll view
//        self.stackView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor).isActive = true;
//        self.stackView.topAnchor.constraint(equalTo: self.scrollView.topAnchor).isActive = true;
//        self.stackView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor).isActive = true;
//        self.stackView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor).isActive = true;
//
//        //constrain width of stack view to width of self.view, NOT scroll view
//        self.stackView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true;
//
//
//         //add image view to stack view
//         let kittenImageView1 = UIImageView(image: UIImage(named: "kittens1"))
//         self.stackView.addArrangedSubview(kittenImageView1)
//
//
//        let kittenImageView2 = UIImageView(image: UIImage(named: "kittens2"))
//        self.stackView.addArrangedSubview(kittenImageView2)
//
//        let kittenImageView3 = UIImageView(image: UIImage(named: "kittens3"))
//        self.stackView.addArrangedSubview(kittenImageView3)
//    }
//

    
}


