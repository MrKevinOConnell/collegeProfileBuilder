//
//  CollegeClass.swift
//  myCollegeProfileBuilderA
//
//  Created by Kevin O'Connell on 2/10/17.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit

class CollegeClass: NSObject {
    var name = ""
    var location = ""
    var enrollment = ""
    var image = UIImage(named:"default")
    var url = URL(string: "")
    
    init(Name: String, Location: String , Enrollment: String, Image: UIImage, Url: URL)
    {
        name = Name
        location = Location
        enrollment = Enrollment
        image = Image
        url = Url
    }
    
    init(Location:String, Name:String, Enrollment:String, Url: URL)
    {
        location = Location
        name = Name
        enrollment = Enrollment
    url = Url
    }
    
}
