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
    var dContact: Dictionary<String, DrContact>
    var eContact: Dictionary<String, EmergencyContact>
    var Location: Location?
    
    init(person: Personal, medical: MedicalInfo, doctor: Dictionary<String, DrContact>, emergency: Dictionary<String, EmergencyContact>, loc: Location)
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
        dContact = [String: DrContact]()
        eContact = [String: EmergencyContact]()
        Location = nil
    }
    
    static func set(card: MedicalCard)
    {
        let shared = card
    }

}
