//
//  AttractionTableViewController.swift
//  TableViewStory
//
//  Created by Kristof on 1/26/16.
//  Copyright © 2016 Kristof. All rights reserved.
//

import UIKit

class AttractionTableViewController: UITableViewController {
    
    var attractionImages = [String]()
    var attractionNames = [String]()
    var attractionNames2 = [String]()
    var webAddresses = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        attractionNames = ["Special 1",
            "Special 2",
            "Special 3",
            "Special 4",
            "Special 5"]
        
        attractionNames2 = ["Special 6",
            "Special 7",
            "Special 8",
            "Special 9",
            "Special 10"]
        
        webAddresses = ["http://en.wikipedia.org/wiki/Buckingham_Palace",
            "http://en.wikipedia.org/wiki/Eiffel_Tower",
            "http://en.wikipedia.org/wiki/Grand_Canyon",
            "http://en.wikipedia.org/wiki/Windsor_Castle",
            "http://en.wikipedia.org/wiki/Empire_State_Building"]
        
        attractionImages = ["profile.png",
            "profile.png",
            "profile.png",
            "profile.png",
            "profile.png"]
        
        tableView.estimatedRowHeight = 50
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return attractionNames.count
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (section == 0){
            return "Happening Now"
        }
        if (section == 1){
            return "Later Tonight"
        }
        return nil
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell =
        self.tableView.dequeueReusableCellWithIdentifier(
            "AttractionTableCell", forIndexPath: indexPath)
            as! AttractionTableViewCell
        
//        let row = indexPath.row
//        cell.attractionLabel.font =
//            UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
//        cell.attractionLabel.text = attractionNames[row]
//        cell.attractionImage.image = UIImage(named: attractionImages[row])
        //cell.textLabel?.text = "Section \(indexPath.section) Row \(indexPath.row)"
        if (indexPath.section == 0){
            cell.attractionLabel.text = attractionNames[indexPath.row]
            cell.attractionImage.image = UIImage(named: attractionImages[indexPath.row])
            
        }
        if (indexPath.section == 1){
            cell.attractionLabel.text = attractionNames2[indexPath.row]
            cell.attractionImage.image = UIImage(named: attractionImages[indexPath.row])
            
        }
        return cell
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
