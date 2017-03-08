//
//  MapViewController.swift
//  myCollegeProfileBuilderA
//
//  Created by Kevin O'Connell on 3/6/17.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, UISearchBarDelegate {
    @IBOutlet weak var myMapView: MKMapView!
    var  mapCollegeClass: CollegeClass!
       var searchController: UISearchController! //manages presentation of search bar
    var annotation: MKAnnotation!//request search for POI (Point of Interest)
    
    var localSearchRequest: MKLocalSearchRequest! //initiates search
    var localSearchResponse: MKLocalSearchResponse! //stores search result
    var pointAnnotation: MKPointAnnotation! //puts point on map
    var pinAnnotationView: MKPinAnnotationView!


    override func viewDidLoad() {
        super.viewDidLoad()
        print(mapCollegeClass.name)
        
        localSearchRequest = MKLocalSearchRequest()
        localSearchRequest.naturalLanguageQuery = mapCollegeClass.name
        let localSearch = MKLocalSearch(request: localSearchRequest)
        localSearch.start { (localSearchResponse,error) in
            
            if localSearchResponse == nil
            {
                let alertController = UIAlertController(title: "Place not found", message: nil, preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
                self.present(alertController, animated: true, completion: nil)
            }
                self.pointAnnotation = MKPointAnnotation()
                self.pointAnnotation.title = self.mapCollegeClass.name
                self.pointAnnotation.coordinate = CLLocationCoordinate2D(latitude: (localSearchResponse?.boundingRegion.center.latitude)!, longitude: (localSearchResponse?.boundingRegion.center.longitude)!)
                self.pinAnnotationView = MKPinAnnotationView(annotation: self.pointAnnotation, reuseIdentifier: nil)
                self.myMapView.centerCoordinate = self.pointAnnotation.coordinate
                self.myMapView.addAnnotation(self.pinAnnotationView.annotation!)
                self.centerMap(location: self.pointAnnotation.coordinate)
            

                
        
            }
       }

    func searchBar(_ sender: Any)
    {
        searchController = UISearchController(searchResultsController: nil)
        searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.searchBar.delegate = self
     
        present(searchController, animated: true, completion: nil)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //step 1: once keyboard is clicked, app will dismiss search controller, then the map will look for any previously drawn annotations and remove them
        searchBar.resignFirstResponder() //takes away keyboard
        dismiss(animated: true, completion: nil)
        if myMapView.annotations.count != 0
        {
            annotation = myMapView.annotations[0]
            myMapView.removeAnnotation(annotation)
        }
        
        //step 2: search process will be initilized turning search bar text into natural language quiery
        localSearchRequest = MKLocalSearchRequest()
        localSearchRequest.naturalLanguageQuery = mapCollegeClass.name
        let localSearch = MKLocalSearch(request: localSearchRequest)
        localSearch.start { (localSearchResponse,error) in
            if localSearchResponse == nil {
                let alertController = UIAlertController(title: "Place not found", message: nil, preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
                self.present(alertController, animated: true, completion: nil)
                return
            }
            self.pointAnnotation = MKPointAnnotation()
            self.pointAnnotation.title = self.mapCollegeClass.name
            self.pointAnnotation.coordinate = CLLocationCoordinate2D(latitude: (localSearchResponse?.boundingRegion.center.latitude)!, longitude: (localSearchResponse?.boundingRegion.center.longitude)!)
            self.pinAnnotationView = MKPinAnnotationView(annotation: self.pointAnnotation, reuseIdentifier: nil)
            self.myMapView.centerCoordinate = self.pointAnnotation.coordinate
            self.myMapView.addAnnotation(self.pinAnnotationView.annotation!)
            self.centerMap(location: self.pointAnnotation.coordinate)
        }
    }
    func centerMap(location: CLLocationCoordinate2D)
    {
        let span = MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
        let region = MKCoordinateRegion(center: location, span: span)
        myMapView.setRegion(region, animated: true)
    }

    
    }
