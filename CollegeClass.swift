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
    
    init(Name: String, Location: String, Enrollment: String, Image: UIImage)
    {
        name = Name
        location = Location
        enrollment = Enrollment
        image = Image
    }
    
    init(Location:String, Name:String)
    {
        location = Location
        name = Name
    }
    
}
