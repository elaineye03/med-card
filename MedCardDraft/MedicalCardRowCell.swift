//
//  MedicalCardRowCell.swift
//  card-storage
//
//  Created by Elaine Ye on 12/29/19.
//  Copyright © 2019 Elaine Ye. All rights reserved.
//

import UIKit

class MedicalCardRowCell: UITableViewCell {
 
    
    
    @IBOutlet weak var keyLabel: UILabel!
    @IBOutlet weak var valueTextField: UITextField!
    override func awakeFromNib() {
       super.awakeFromNib()
        
//        // 1
//       let layoutGuide = UILayoutGuide()
//       contentView.addLayoutGuide(layoutGuide)
//
//       // 2
//       let topConstraint = layoutGuide.topAnchor
//         .constraint(equalTo: keyLabel.topAnchor)
//
//       // 3
//       let bottomConstraint = layoutGuide.bottomAnchor
//         .constraint(equalTo: valueLabel.bottomAnchor)
//
//       // 4
//       let centeringConstraint = layoutGuide.centerYAnchor
//         .constraint(equalTo: contentView.centerYAnchor)
//
//       // 5
//       NSLayoutConstraint.activate(
//         [topConstraint, bottomConstraint, centeringConstraint])
//
    }
}
