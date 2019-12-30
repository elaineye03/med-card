//
//  TextContactsViewController.swift
//  MedCardDraft
//
//  Created by Stanley Ye on 12/29/19.
//  Copyright © 2019 Elaine Ye. All rights reserved.
//

import UIKit

class TextContactsViewController: UITableViewController {
    
    var eContactsRows: [String] = ["S", "Y", "E"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eContactsRows.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "ContactRowCell", for: indexPath)
         
       // cell.textLabel!.text = eContactsRows[indexPath.row]
        
         return cell
    }
}
