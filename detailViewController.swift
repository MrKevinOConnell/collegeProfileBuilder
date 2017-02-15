//
//  detailViewController.swift
//  myCollegeProfileBuilderA
//
//  Created by Kevin O'Connell on 2/13/17.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit

class detailViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var enrollmentTextField: UITextField!
    
    
     var CollegeDetail:CollegeClass!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    
    
    myImageView.image = CollegeDetail.image!
    nameTextField.text = CollegeDetail.name
    locationTextField.text =  CollegeDetail.location
    enrollmentTextField.text = CollegeDetail.enrollment

    

}
