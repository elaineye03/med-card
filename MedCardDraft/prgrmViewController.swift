//
//  prgrmViewController.swift
//  MedCardDraft
//
//  Created by Elaine Ye on 12/28/19.
//  Copyright © 2019 Elaine Ye. All rights reserved.
//

import Foundation
import UIKit

class prgrmViewController: UIViewController {
    let scrollView = UIScrollView()
    let stackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.view.backgroundColor = UIColor.gray
        
        //Add and setup scroll view
        self.view.addSubview(self.scrollView)
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false;

        //Constrain scroll view
        self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true;
        self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true;
        self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true;
        self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20).isActive = true;

        //Add and setup stack view
        self.scrollView.addSubview(self.stackView)
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.axis = .vertical
        self.stackView.spacing = 10;

        //constrain stack view to scroll view
        self.stackView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor).isActive = true;
        self.stackView.topAnchor.constraint(equalTo: self.scrollView.topAnchor).isActive = true;
        self.stackView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor).isActive = true;
        self.stackView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor).isActive = true;
        
        //constrain width of stack view to width of self.view, NOT scroll view
        self.stackView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true;
        
        //add image views to stack view
        
        addBigLabels(labelName: "Personal")
        addLabels(labelName: "Name", labelValue: MedicalCard.shared.Person!.Name)
        addLabels(labelName: "DOB", labelValue: MedicalCard.shared.Person!.DOB)
        addLabels(labelName: "Gender", labelValue: MedicalCard.shared.Person!.Gender)
        addLabels(labelName: "Address", labelValue: MedicalCard.shared.Person!.Address)
        addLabels(labelName: "Phone", labelValue: MedicalCard.shared.Person!.Phone)
        addLabels(labelName: "Email", labelValue: MedicalCard.shared.Person!.Email)
        addLabels(labelName: "SSN", labelValue: MedicalCard.shared.Person!.SSN)
        addBigLabels(labelName: "Medical Info")
        addLabels(labelName: "Allergy", labelValue: MedicalCard.shared.Medinfo!.Allergy)
        addLabels(labelName: "Medication", labelValue: MedicalCard.shared.Medinfo!.Medication)
        addLabels(labelName: "Medical Condition", labelValue: MedicalCard.shared.Medinfo!.Condition)
        addLabels(labelName: "Blood Type", labelValue: MedicalCard.shared.Medinfo!.BloodType)
        addBigLabels(labelName: "Insurance")
        addLabels(labelName: "Provider", labelValue: MedicalCard.shared.Medinfo!.Insurance["provider"]!)
        addLabels(labelName: "Group", labelValue: MedicalCard.shared.Medinfo!.Insurance["group"]!)
        addLabels(labelName: "Policy", labelValue: MedicalCard.shared.Medinfo!.Insurance["policy"]!)
        addLabels(labelName: "InsuredName", labelValue: MedicalCard.shared.Medinfo!.Insurance["InsuredName"]!)
        
        addBigLabels(labelName: "Emergency Contact")
        for (numcontact, contact) in MedicalCard.shared.eContact {
            
            addLabels(labelName: "Name", labelValue: contact.Name)
            addLabels(labelName: "Phone", labelValue: contact.Phone)
            addLabels(labelName: "Email", labelValue: contact.Email)
            addLabels(labelName: "Relationship", labelValue: contact.Relation)
            
        }
        
        addBigLabels(labelName: "Doctor Contact")
        for (numdoc, doc) in MedicalCard.shared.dContact {
            addBigLabels(labelName: String(numdoc))
            addLabels(labelName: "Kind", labelValue: doc.Kind)
            addLabels(labelName: "Name", labelValue: doc.Name)
            addLabels(labelName: "Phone", labelValue: doc.Phone)
            addLabels(labelName: "Email", labelValue: doc.Email)
            
        }
        //addBigLabels(labelName: "")
//
    }
    func addLabels(labelName: String, labelValue: String)
    {
        let label = UILabel(frame: CGRect(x:0, y:1050, width: 500, height:210))
        label.textAlignment = .center
        label.text = labelName + ": " + labelValue
        label.sizeToFit()
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        self.stackView.addArrangedSubview(label)
    }
    
    func addBigLabels(labelName: String)
    {
        let label = UILabel(frame: CGRect(x:0, y:1050, width: 500, height:210))
        label.textAlignment = .center
        label.text = labelName
        label.font = label.font.withSize(25)
        self.stackView.addArrangedSubview(label)
    }
}
