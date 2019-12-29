//
//  MedicalInfo.swift
//  MedCardDraft
//
//  Created by Elaine Ye on 12/28/19.
//  Copyright © 2019 Elaine Ye. All rights reserved.
//

import Foundation

struct MedicalInfo: Codable {
    var Allergy: String
    var Condition: String
    var Medication: String
    var Insurance: Dictionary<String, String>
    var BloodType: String
    
}
