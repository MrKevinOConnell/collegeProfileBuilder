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
        
        
        
        colleges.append(CollegeClass(Name: "Marquette", Location: "Milwaukee,Wisconsin", Enrollment:"11,745",Image:UIImage(named:"marquette")!,
            Url: URL(string: "http://marquette.edu/")!))
        
        colleges.append(CollegeClass(Name:"Wisconsin",Location: "Madison,Wisconsin",Enrollment:"43,193",Image:UIImage(named:"wisconsin")!,
            Url: URL(string: "http://www.wisc.edu/")!))
        
        colleges.append(CollegeClass(Name:"Michigan", Location:"Ann Arbor, Michigan", Enrollment: "44,713", Image:UIImage(named:"michigan")!, Url: URL (string:"https://umich.edu/")!))
    }
    
    
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
       //puts colleges into cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell",for: indexPath)
        
        cell.textLabel?.text = colleges[indexPath.row].name
        cell.detailTextLabel?.text = colleges[indexPath.row].location
       return cell
    }
   //gets # of colleges
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
       return colleges.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete)
        {
            colleges.remove(at: indexPath.row)
            myTableView.reloadData()
        }
        
    }//adds button that allows additional colleges to be entered
    @IBAction func addButtonTapped(_ sender: Any)
    {
        let alert = UIAlertController(title: "Add college", message: nil, preferredStyle: .alert)
        alert.addTextField { (nameTextField) in nameTextField.placeholder = "add college name here" }
        alert.addTextField { (locationTextField) in locationTextField.placeholder = "add location of college here"}
        
        alert.addTextField { (enrollmentTextField) in enrollmentTextField.placeholder = "add total enrollment of college here" }
        alert.addTextField { (urlTextField) in urlTextField.placeholder = "add url of college here"}
      
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        let addAction = UIAlertAction(title:"Add", style: .default)
        {
            (action) in
            let nameTextField = alert.textFields?[0]
            let locationTextField = alert.textFields?[1]
            let enrollmentTextField = alert.textFields?[2]
            let urlTextField = alert.textFields?[3]
            self.colleges.append(CollegeClass(Location: (locationTextField?.text)!, Name: (nameTextField?.text)!, Enrollment:(enrollmentTextField?.text)!, Url:(URL(string:(urlTextField?.text!)!))!))
            self.myTableView.reloadData()
        }
        alert.addAction(addAction)
        
        present(alert, animated: true, completion: nil)
    }
    
   

    

    //brings info to the detail view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailView = segue.destination as! detailViewController
        var selectedRow = myTableView.indexPathForSelectedRow?.row
        
        detailView.CollegeDetail = colleges[selectedRow!]    }
    
//allows data to be transfered back from detail view controller to main view controller
    override func viewDidAppear(_ animated: Bool) {
    self.myTableView.reloadData()
        
    }
    }


