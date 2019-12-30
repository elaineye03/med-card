//
//  MedicalCardViewController.swift
//  MedCardDraft
//
//  Created by Elaine Ye on 12/28/19.
//  Copyright © 2019 Elaine Ye. All rights reserved.
//

import Foundation
import UIKit

class MedicalCardViewController: UIViewController ,UIScrollViewDelegate{

    //@IBOutlet weak var scrollView: UIScrollView!
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    
    //var myLabel = MyLabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
                //Add and setup scroll view
                self.view.addSubview(self.scrollView)
                self.scrollView.translatesAutoresizingMaskIntoConstraints = false;

                //Constrain scroll view
                self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true;
                self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20).isActive = true;
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
                
               
                
                let label = UILabel(frame: CGRect(x:0, y:0, width: 300, height:210))
                label.textAlignment = .center
                label.text = "I'm a test label"
        
                self.stackView.addArrangedSubview(label)

                let label2 = UILabel(frame: CGRect(x:0, y:210, width: 300, height:210))
                label2.textAlignment = .center
                label2.text = "I'm a test label2"
                self.stackView.addArrangedSubview(label2)


                let label3 = UILabel(frame: CGRect(x:0, y:420, width: 300, height:210))
                label3.textAlignment = .center
                label3.text = "I'm a test label3"
        //        label3.sizeToFit()
                self.stackView.addArrangedSubview(label3)


                let label4 = UILabel(frame: CGRect(x:0, y:630, width: 300, height:210))
                label4.textAlignment = .center
                label4.text = "I'm a test label4"
        //        label4.sizeToFit()
                self.stackView.addArrangedSubview(label4)


                let label5 = UILabel(frame: CGRect(x:0, y:840, width: 300, height:210))
                label5.textAlignment = .center
                label5.text = "I'm a test label5"
        //        label5.sizeToFit()
                self.stackView.addArrangedSubview(label5)


                let label6 = UILabel(frame: CGRect(x:0, y:1050, width: 300, height:210))
                label6.textAlignment = .center
                label6.text = "I'm a test label6"
        //        label6.sizeToFit()
                self.stackView.addArrangedSubview(label6)

                let button = UIButton(frame: CGRect(x: 100, y: 1260, width: 300, height: 210))
                 button.backgroundColor = .green
                 button.setTitle( "Test Button", for: .normal)
        //        button.addTarget(self, action: #selector(self.buttonClicked), for: .touchUpInside)
                 self.stackView.addArrangedSubview(button)
                
                        let button2 = UIButton(frame: CGRect(x: 100, y: 1260, width: 300, height: 210))
                         button2.backgroundColor = .green
                         button2.setTitle( "Test Button", for: .normal)
                //        button.addTarget(self, action: #selector(self.buttonClicked), for: .touchUpInside)
                         self.stackView.addArrangedSubview(button2)
                
                        let button3 = UIButton(frame: CGRect(x: 100, y: 1260, width: 300, height: 210))
                         button3.backgroundColor = .blue
                         button3.setTitle( "Test Button", for: .normal)
                //        button.addTarget(self, action: #selector(self.buttonClicked), for: .touchUpInside)
                         self.stackView.addArrangedSubview(button3)
                
                        let button4 = UIButton(frame: CGRect(x: 100, y: 1260, width: 300, height: 210))
                         button4.backgroundColor = .red
                         button4.setTitle( "Test Button", for: .normal)
                //        button.addTarget(self, action: #selector(self.buttonClicked), for: .touchUpInside)
                         self.stackView.addArrangedSubview(button4)
                
                        let button5 = UIButton(frame: CGRect(x: 100, y: 1260, width: 300, height: 210))
                         button5.backgroundColor = .green
                         button5.setTitle( "Test Button", for: .normal)
                //        button.addTarget(self, action: #selector(self.buttonClicked), for: .touchUpInside)
                         self.stackView.addArrangedSubview(button5)
                
                        let button6 = UIButton(frame: CGRect(x: 100, y: 1260, width: 300, height: 210))
                         button6.backgroundColor = .green
                         button6.setTitle( "Test Button", for: .normal)
                //        button.addTarget(self, action: #selector(self.buttonClicked), for: .touchUpInside)
                         self.stackView.addArrangedSubview(button6)
                
                        let button7 = UIButton(frame: CGRect(x: 100, y: 1260, width: 300, height: 210))
                         button7.backgroundColor = .green
                         button7.setTitle( "Test Button", for: .normal)
                //        button.addTarget(self, action: #selector(self.buttonClicked), for: .touchUpInside)
                         self.stackView.addArrangedSubview(button7)
                
                        let button8 = UIButton(frame: CGRect(x: 100, y: 1260, width: 300, height: 210))
                         button8.backgroundColor = .green
                         button8.setTitle( "Test Button", for: .normal)
                //        button.addTarget(self, action: #selector(self.buttonClicked), for: .touchUpInside)
                         self.stackView.addArrangedSubview(button8)
                
                        let button9 = UIButton(frame: CGRect(x: 100, y: 1260, width: 300, height: 210))
                         button9.backgroundColor = .green
                         button9.setTitle( "Test Button", for: .normal)
                //        button.addTarget(self, action: #selector(self.buttonClicked), for: .touchUpInside)
                         self.stackView.addArrangedSubview(button9)
   
    }


}
