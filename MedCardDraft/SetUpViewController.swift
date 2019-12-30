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
    
    
    override func awakeFromNib() {
      super.awakeFromNib()
      
      medicalRows = MedicalCardRow.loadCardRowsFromPlist("mid")
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return medicalRows.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "MedicalCardRowCell", for: indexPath) as! MedicalCardRowCell
      let medicalRow = medicalRows[indexPath.row]
      cell.keyLabel.text = medicalRow.key
        print(medicalRow.value + " key: " + medicalRow.key)
        if (medicalRow.value == "(TITLE)")
        {
            cell.valueTextField.isHidden = true
        }
        else
        {
            cell.valueTextField.text = medicalRow.value
            cell.valueTextField.isEnabled = false
            cell.valueTextField.isHidden = false
        }
      
        
    
     //   cell.thumbnailImageView.image = UIImage(named: vacationSpot.thumbnailName)
        
      
      return cell
    }
    
    @IBAction func refreshButton(_ sender: UIButton) {
//        self.tableView.currentIndexPath = NSIndexPath(forRow: 0, inSection: 0)
        medicalRows = MedicalCardRow.loadCardRowsFromPlist("mid")
        self.tableView.reloadData()
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
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


