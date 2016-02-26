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

    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var barLabel: UILabel!
    
    var myCustomViewController: AttractionTableViewController = AttractionTableViewController(nibName: nil, bundle: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let barName = myCustomViewController.barName
        barLabel.text = barName
        // Do any additional setup after loading the view.
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
