//
//  detailViewController.swift
//  myCollegeProfileBuilderA
//
//  Created by Kevin O'Connell on 2/13/17.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit
import SafariServices

class detailViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate
 {
    
    var CollegeDetail: CollegeClass!

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var enrollmentTextField: UITextField!
    
    @IBAction func tapped(_ sender: UITapGestureRecognizer) {
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myImageView.image = CollegeDetail.image!
        nameTextField.text = CollegeDetail.name
        locationTextField.text =  CollegeDetail.location
        enrollmentTextField.text = CollegeDetail.enrollment
         urlTextField.text = CollegeDetail.url?.absoluteString
        imagePicker.delegate = self

    }
  
    let imagePicker = UIImagePickerController()

    //button that brings app to website(with back button)
    @IBAction func collegeWebsite(_ sender: Any)
    {
        let svc = SFSafariViewController(url: URL(string:urlTextField.text!)!)
        present(svc, animated: true, completion: nil)

    }
    @IBAction func saveButtonTapped(_ sender: Any)
    {
        CollegeDetail.url = URL(string:urlTextField.text!)
        CollegeDetail.image = myImageView.image!
          CollegeDetail.name = nameTextField.text!
         CollegeDetail.location = locationTextField.text!
       CollegeDetail.enrollment = enrollmentTextField.text!
    }
    
    
    @IBAction func myCollegeLibrary(_ sender: Any)
    {
        getPhotoLibrary()
    }
    
    func getPhotoLibrary()
    {
        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        imagePicker.dismiss(animated: true)
        {
            let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            
            self.myImageView.image = selectedImage
        }
    }
    @IBAction func tap(_ sender: UITapGestureRecognizer)
    {
        view.endEditing(true)
    }
 }
