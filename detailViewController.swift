//
//  detailViewController.swift
//  myCollegeProfileBuilderA
//
//  Created by Kevin O'Connell on 2/13/17.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit

class detailViewController: UIViewController {
    
    var CollegeDetail: CollegeClass!

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var enrollmentTextField: UITextField!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myImageView.image = CollegeDetail.image!
        nameTextField.text = CollegeDetail.name
        locationTextField.text =  CollegeDetail.location
        enrollmentTextField.text = CollegeDetail.enrollment
        

        
    }
  
    
    @IBAction func saveButtonTapped(_ sender: Any)
    {
       CollegeDetail.image = myImageView.image!
          CollegeDetail.name = nameTextField.text!
         CollegeDetail.location = locationTextField.text!
       CollegeDetail.enrollment = enrollmentTextField.text!
    }
}
