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

    let titleEmergency = MedicalCardRow(key: "Contacts", value:  "(TITLE)")
    cardRows.append(titleEmergency)
    
    for (contact) in MedicalCard.shared.eContact {
        
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
