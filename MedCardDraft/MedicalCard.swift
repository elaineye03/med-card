//
//  MedicalCard.swift
//  MedCardDraft
//
//  Created by Elaine Ye on 12/28/19.
//  Copyright © 2019 Elaine Ye. All rights reserved.
//

import Foundation


class MedicalCard : Codable{

    static var shared = MedicalCard()

    var Person: Personal?
    var Medinfo: MedicalInfo?
    var dContact: DrContact?
    var eContact: [EmergencyContact]
    var Location: Location?
    
    init(person: Personal, medical: MedicalInfo, doctor: DrContact, emergency: [EmergencyContact], loc: Location)
    {
        Person = person
        Medinfo = medical
        dContact = doctor
        eContact = emergency
        Location = loc
    }
    init()
    {
        Person = nil
        Medinfo = nil
        dContact = nil
        eContact = []
        Location = nil
    }
    
    static func set(card: MedicalCard)
    {
        let shared = card
    }

}
