//
//  ProfileViewController.swift
//  TableViewStory
//
//  Created by Kristof on 2/20/16.
//  Copyright © 2016 Kristof. All rights reserved.
//

import UIKit
import MapKit

class ProfileViewController: UIViewController {
    
    var bar = ""

    @IBOutlet weak var barImg: UIImageView!
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var barLabel: UILabel!
    
    @IBOutlet weak var barDesc: UITextView!
    
    @IBOutlet weak var barFeat: UILabel!
    
    @IBOutlet weak var barHours: UILabel!
    
    @IBOutlet weak var barPhone: UILabel!
    
    @IBOutlet weak var barAddress: UILabel!
    
    
    var myCustomViewController: AttractionTableViewController = AttractionTableViewController(nibName: nil, bundle: nil)
    
    let regionRadius: CLLocationDistance = 60
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        barLabel.text = bar
        if (bar == "Absinthe House"){
            barImg.image = UIImage(named: "rainbow_PNG5584")
            barDesc.text = "THIS IS THE ABSITHE HAUS!!!!!!!!!!!!!!!!!!"
            barFeat.text = "GET LOW"
            barHours.text = "24/7"
            barPhone.text = "867-5309"
            barAddress.text = "8008 DickButt Drive"
            
            let lat = 40.016989
            
            let lon = -105.280668
            
            let latitude:CLLocationDegrees = lat
            let longitude:CLLocationDegrees = lon
            let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
            
            // set initial location in Honolulu
            let initialLocation = CLLocation(latitude: lat, longitude: lon)
            let annotation = MKPointAnnotation()
            annotation.coordinate = location
            annotation.title = bar
            //annotation.subtitle = "One day bla bla"
            mapView.addAnnotation(annotation)
            
            
            centerMapOnLocation(initialLocation)
        }
        if (bar == "Walrus"){
            barImg.image = UIImage(named: "rainbow_PNG5584")
            barDesc.text = "THIS IS THE WALRUS!!!!!!!!!!!!!!!!!!"
            barFeat.text = "GET LOW"
            barHours.text = "24/7"
            barPhone.text = "867-5309"
            barAddress.text = "8008 DickButt Drive"
            
            let lat = 40.016861
            
            let lon = -105.281284
            
            let latitude:CLLocationDegrees = lat
            let longitude:CLLocationDegrees = lon
            let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
            
            // set initial location in Honolulu
            let initialLocation = CLLocation(latitude: lat, longitude: lon)
            let annotation = MKPointAnnotation()
            annotation.coordinate = location
            annotation.title = bar
            //annotation.subtitle = "One day bla bla"
            mapView.addAnnotation(annotation)
            
            
            centerMapOnLocation(initialLocation)
        }
        
        if (bar == "Press Play"){
            barImg.image = UIImage(named: "rainbow_PNG5584")
            barDesc.text = "THIS IS PRESS PLAY!!!!!!!!!!!!!!!!!!"
            barFeat.text = "GET LOW"
            barHours.text = "24/7"
            barPhone.text = "867-5309"
            barAddress.text = "8008 DickButt Drive"
            
            let lat = 40.017533
            
            let lon = -105.282408
            
            let latitude:CLLocationDegrees = lat
            let longitude:CLLocationDegrees = lon
            let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
            
            // set initial location in Honolulu
            let initialLocation = CLLocation(latitude: lat, longitude: lon)
            let annotation = MKPointAnnotation()
            annotation.coordinate = location
            annotation.title = bar
            //annotation.subtitle = "One day bla bla"
            mapView.addAnnotation(annotation)
            
            
            centerMapOnLocation(initialLocation)
        }
        
        if (bar == "Biergarten"){
            barImg.image = UIImage(named: "rainbow_PNG5584")
            barDesc.text = "THIS IS THE BIERGARTEN!!!!!!!!!!!!!!!!!!"
            barFeat.text = "GET LOW"
            barHours.text = "24/7"
            barPhone.text = "867-5309"
            barAddress.text = "8008 DickButt Drive"
            
            let lat = 40.018575
            
            let lon = -105.278910
            
            let latitude:CLLocationDegrees = lat
            let longitude:CLLocationDegrees = lon
            let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
            
            // set initial location in Honolulu
            let initialLocation = CLLocation(latitude: lat, longitude: lon)
            let annotation = MKPointAnnotation()
            annotation.coordinate = location
            annotation.title = bar
            //annotation.subtitle = "One day bla bla"
            mapView.addAnnotation(annotation)
            
            
            centerMapOnLocation(initialLocation)
        }
        
        if (bar == "Tahona"){
            barImg.image = UIImage(named: "rainbow_PNG5584")
            barDesc.text = "THIS IS TAHONA!!!!!!!!!!!!!!!!!!"
            barFeat.text = "GET LOW"
            barHours.text = "24/7"
            barPhone.text = "867-5309"
            barAddress.text = "8008 DickButt Drive"
            
            let lat = 40.017786
            
            let lon = -105.281948
            
            let latitude:CLLocationDegrees = lat
            let longitude:CLLocationDegrees = lon
            let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
            
            // set initial location in Honolulu
            let initialLocation = CLLocation(latitude: lat, longitude: lon)
            let annotation = MKPointAnnotation()
            annotation.coordinate = location
            annotation.title = bar
            //annotation.subtitle = "One day bla bla"
            mapView.addAnnotation(annotation)
            
            
            centerMapOnLocation(initialLocation)
        }

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
