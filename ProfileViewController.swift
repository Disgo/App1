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
            barImg.image = UIImage(named: "profile-1")
            barDesc.text = "Hip cocktail lounge & rooftop bar with absinthe service & snacks, DJs & dancing, plus happy hour."
            barFeat.text = "DJ. Full bar. Patio."
            barHours.text = "11:00 am - 2:00 am"
            barPhone.text = "(303) 443-8600"
            barAddress.text = "1109 Walnut St, Boulder, CO 80302"
            
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
        if (bar == "The Walrus"){
            barImg.image = UIImage(named: "profile-1")
            barDesc.text = "Dark, raucous nightclub long known for booze bargains, DJs, dancing & games of all kinds."
            barFeat.text = "-"
            barHours.text = "4:00 pm - 2:00 am"
            barPhone.text = "(303) 443-9902"
            barAddress.text = "1911 11th St, Boulder, CO 80302"
            
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
            barImg.image = UIImage(named: "profile-1")
            barDesc.text = "No-frills hangout with pub grub, flat-screens & various old-school video games in a simple space."
            barFeat.text = "-"
            barHours.text = "4:00 pm - 2:00 am"
            barPhone.text = "(720) 508-4916"
            barAddress.text = "1005 Pearl St, Boulder, CO 80302"
            
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
            barImg.image = UIImage(named: "profile-1")
            barDesc.text = "Rustic, Czech-style place offering a wide beer menu & traditional eats, plus a patio & live music."
            barFeat.text = "-"
            barHours.text = "12:00 pm - 2:00 am"
            barPhone.text = "(720) 328-8328"
            barAddress.text = "2017 13th St, Boulder, CO 80302"
            
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
            barImg.image = UIImage(named: "profile-1")
            barDesc.text = "Chill choice with a wall of windows & a patio serving inventive Mexican meals & strong drinks."
            barFeat.text = "-"
            barHours.text = "3:00 pm - 1:00 am"
            barPhone.text = "(303) 938-9600"
            barAddress.text = "1035 Pearl St, Boulder, CO 80302"
            
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
        
        if (bar == "The Rio"){
            barImg.image = UIImage(named: "profile-1")
            barDesc.text = "Chill choice with a wall of windows & a patio serving inventive Mexican meals & strong drinks."
            barFeat.text = "-"
            barHours.text = "3:00 pm - 1:00 am"
            barPhone.text = "(303) 938-9600"
            barAddress.text = "1035 Pearl St, Boulder, CO 80302"
            
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
        
        if (bar == "The Downer"){
            barImg.image = UIImage(named: "profile-1")
            barDesc.text = "Chill choice with a wall of windows & a patio serving inventive Mexican meals & strong drinks."
            barFeat.text = "-"
            barHours.text = "3:00 pm - 1:00 am"
            barPhone.text = "(303) 938-9600"
            barAddress.text = "1035 Pearl St, Boulder, CO 80302"
            
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
