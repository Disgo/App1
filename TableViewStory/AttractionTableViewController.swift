//
//  AttractionTableViewController.swift
//  TableViewStory
//
//  Created by Kristof on 1/26/16.
//  Copyright © 2016 Kristof. All rights reserved.
//

import UIKit

class AttractionTableViewController: UITableViewController {
    
//    let date = NSDate()
//    let calendar = NSCalendar.currentCalendar()
//    let components = NSCalendar.currentCalendar().components(.CalendarUnitHour | .CalendarUnitMinute, fromDate: date)
//    let hour = components.hour
//    let minutes = components.minute
    
    let currentDate = NSDate()
    //let dateComponents = NSDateComponents()
    let calendar = NSCalendar.currentCalendar()
    let dateComponents = NSCalendar.currentCalendar().components([NSCalendarUnit.Day, NSCalendarUnit.Month, NSCalendarUnit.Year, NSCalendarUnit.WeekOfYear, NSCalendarUnit.Hour, NSCalendarUnit.Minute, NSCalendarUnit.Second, NSCalendarUnit.Nanosecond], fromDate: NSDate())
    
    //dateComponents.month
    
    
//    let year = NSDateComponents().year
//    let month = NSDateComponents().month
//    let day = NSDateComponents().day
//    let hour = NSDateComponents().hour
//    let minute = NSDateComponents().minute
    
    
    var attractionImages = [String]()
    var attractionNames = [String]()
    var attractionNames2 = [String]()
    var times = [Int]()
    var current: Int = 0
    var current2: Int = 0
    var timesAppend: Int = 0
//    var cells1: Int = 0
//    var cells2: Int = 0
    
    func sortTime(){
        for ( var i: Int = 0;i < 23; i++){
            timesAppend = (dateComponents.hour + i)
            if (timesAppend > 24){
                timesAppend = timesAppend - 24
            }
            times.append(timesAppend)
        }
        for time in times {
            if (dateComponents.hour == time){
                if (time == 12){
                    attractionNames.append("\(time) pm")
                }
                else if (time > 12){
                    current = time - 12
                    attractionNames.append("\(current) pm")
                }
                else {
                    attractionNames.append("\(time) am")
                }
                attractionImages.append("profile.png")
                //                cells1++
            }
            else {
                if (time == 12){
                    attractionNames2.append("\(time) pm")
                }
                else if (time > 12){
                    current2 = time - 12
                    attractionNames2.append("\(current2) pm")
                }
                else {
                    attractionNames2.append("\(time) am")
                }
                attractionImages.append("profile.png")
            }
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sortTime()
//        attractionNames = []
//        
//        attractionNames2 = []
        
        
        
//        attractionImages = ["profile.png",
//            "profile.png",
//            "profile.png",
//            "profile.png",
//            "profile.png"]
        
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
    
    var numberOfRowsAtSection: [Int] = []
    var rows: Int = 0
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        numberOfRowsAtSection = [attractionNames.count,attractionNames2.count]
        rows = numberOfRowsAtSection[section]
        return rows
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
