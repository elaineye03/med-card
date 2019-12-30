//
//  MedicalCard.swift
//  card-storage
//
//  Created by Elaine Ye on 12/29/19.
//  Copyright © 2019 Elaine Ye. All rights reserved.
//

import Foundation

struct MedicalCardRow {

  let key: String
  let value: String
  
  
}

extension MedicalCardRow {
  static var defaultRows: [MedicalCardRow] = {
    return loadCardRows()
  }()
  
  static func loadCardRows() -> [MedicalCardRow] {
//    guard
//      let path = Bundle.main.path(forResource: plistName, ofType: "plist"),
//      let dictArray = NSArray(contentsOfFile: path) as? [[String : AnyObject]]
//      else {
//        fatalError("An error occurred while reading \(plistName).plist")
//    }
    
    var cardRows: [MedicalCardRow] = []
    
    let titlePersonal = MedicalCardRow(key: "Personal Info", value:  "(TITLE)")
    cardRows.append(titlePersonal)
    
    let aRow = MedicalCardRow(key: "Name", value: MedicalCard.shared.Person!.Name)
    cardRows.append(aRow)
    
    let bRow = MedicalCardRow(key: "Date of Birth", value: MedicalCard.shared.Person!.DOB)
    cardRows.append(bRow)
    
    let cRow = MedicalCardRow(key: "Gender", value:  MedicalCard.shared.Person!.Gender)
    cardRows.append(cRow)
    
    let eRow = MedicalCardRow(key: "Address", value:  MedicalCard.shared.Person!.Address)
    cardRows.append(eRow)
    
    let fRow = MedicalCardRow(key: "Phone", value:  MedicalCard.shared.Person!.Phone)
    cardRows.append(fRow)
    
    let gRow = MedicalCardRow(key: "Email", value:  MedicalCard.shared.Person!.Email)
    cardRows.append(gRow)
    
    let hRow = MedicalCardRow(key: "SSN", value:  MedicalCard.shared.Person!.SSN)
    cardRows.append(hRow)
    
    let titleMed = MedicalCardRow(key: "Medical Info", value:  "(TITLE)")
    cardRows.append(titleMed)
    
    let iRow = MedicalCardRow(key: "Allergy", value:  MedicalCard.shared.Medinfo!.Allergy)
    cardRows.append(iRow)
    
    let jRow = MedicalCardRow(key: "Medication", value:  MedicalCard.shared.Medinfo!.Medication)
    cardRows.append(jRow)
    
    let kRow = MedicalCardRow(key: "Condition", value:  MedicalCard.shared.Medinfo!.Condition)
    cardRows.append(kRow)
    
    let lRow = MedicalCardRow(key: "BloodType", value:  MedicalCard.shared.Medinfo!.BloodType)
    cardRows.append(lRow)
    
    let titleInsurance = MedicalCardRow(key: "Insurance Info", value:  "(TITLE)")
    cardRows.append(titleInsurance)
    
    let mRow = MedicalCardRow(key: "Provider", value:  MedicalCard.shared.Medinfo!.Insurance["provider"]!)
    cardRows.append(mRow)
    
    let nRow = MedicalCardRow(key: "Group", value:  MedicalCard.shared.Medinfo!.Insurance["group"]!)
    cardRows.append(nRow)
    
    let oRow = MedicalCardRow(key: "Policy", value:  MedicalCard.shared.Medinfo!.Insurance["policy"]!)
    cardRows.append(oRow)
    
    let pRow = MedicalCardRow(key: "InsuredName", value:  MedicalCard.shared.Medinfo!.Insurance["InsuredName"]!)
    cardRows.append(pRow)
    
    
    
    let titleDoc = MedicalCardRow(key: "Doctor Contact", value:  "(TITLE)")
    cardRows.append(titleDoc)
    
    
    let nameRow = MedicalCardRow(key: "Name", value: MedicalCard.shared.dContact!.Name)
    cardRows.append(nameRow)
    let phoneRow = MedicalCardRow(key: "Phone", value:  MedicalCard.shared.dContact!.Phone)
    cardRows.append(phoneRow)
    let emailRow = MedicalCardRow(key: "Email", value:  MedicalCard.shared.dContact!.Email)
    cardRows.append(emailRow)
    let kindRow = MedicalCardRow(key: "Kind", value:  MedicalCard.shared.dContact!.Kind)
    cardRows.append(kindRow)

        

    let titleEmergency = MedicalCardRow(key: "Contacts", value:  "(TITLE)")
    cardRows.append(titleEmergency)
    
    for (numcontact, contact) in MedicalCard.shared.eContact {
        
        let nameRow = MedicalCardRow(key: "Name", value:  contact.Name)
        cardRows.append(nameRow)
        let phoneRow = MedicalCardRow(key: "Phone", value:  contact.Phone)
        cardRows.append(phoneRow)
        let emailRow = MedicalCardRow(key: "Email", value:  contact.Email)
        cardRows.append(emailRow)
        let relationRow = MedicalCardRow(key: "Relationship", value:  contact.Relation)
        cardRows.append(relationRow)
        
    }
    

    
    return cardRows
  }
}
