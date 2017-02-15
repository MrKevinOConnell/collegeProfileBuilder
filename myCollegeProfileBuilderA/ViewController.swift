//
//  ViewController.swift
//  myCollegeProfileBuilderA
//
//  Created by Kevin O'Connell on 2/8/17.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var myTableView: UITableView!
    
    var colleges:[CollegeClass] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        colleges.append(CollegeClass(Name: "Marquette",Location: "Milwakee,Wisconsin", Enrollment:"11,745",Image:UIImage(named:"marquette")!))
         colleges.append(CollegeClass(Name:"Wisconsin",Location: "Madison,Wisconsin",Enrollment:"43,193",Image:UIImage(named:"wisconsin")!))
         colleges.append(CollegeClass(Name:"Michigan", Location:"Ann Arbor, Michigan", Enrollment:"44,713", Image:UIImage(named:"michigan")!))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return colleges.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell",for: indexPath)
        
        cell.textLabel?.text = colleges[indexPath.row].name
        cell.detailTextLabel?.text = colleges[indexPath.row].location
        myTableView.reloadData()
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete)
        {
            colleges.remove(at: indexPath.row)
            myTableView.reloadData()
        }
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let detailView = segue.destination as! detailViewController
            var selectedRow = myTableView.indexPathForSelectedRow?.row
            
            detailView.collegeDetail = colleges[selectedRow!]

        }
    }
}
