//
//  AttractionTableViewController.swift
//  TableViewStory
//
//  Created by Kristof on 1/26/16.
//  Copyright © 2016 Kristof. All rights reserved.
//

import UIKit

class AttractionTableViewController: UITableViewController {
    
    let currentDate = NSDate()
    //let dateComponents = NSDateComponents()
    let calendar = NSCalendar.currentCalendar()
    let dateComponents = NSCalendar.currentCalendar().components([NSCalendarUnit.Day, NSCalendarUnit.Month, NSCalendarUnit.Year, NSCalendarUnit.WeekOfYear, NSCalendarUnit.Hour, NSCalendarUnit.Minute, NSCalendarUnit.Second, NSCalendarUnit.Nanosecond], fromDate: NSDate())
    
    
    var attractionImages = [String]()
    var attractionImages2 = [String]()
    var attractionNames = [String]()
    var attractionNames2 = [String]()
    var attractionTimes = [String]()
    var attractionTimes2 = [String]()
    var times = [Int]()
    var current: Int = 0
    var current2: Int = 0
    var timesAppend: Int = 0
    var i: Int = 0
    var specialsArray: [String] = ["$4 COLLEGE MARGARITAS",
                "$3 CALLS\n$4 WELLS",
                "$7 PITCHERS OF PBR",
                "FISHBOWLS ALL NIGHT",
                "FREE LAP DANCES"]
    var specialsImages: [String] = ["icon-test",
    "icon-test",
    "icon-test",
    "icon-test",
    "icon-test"]

    
    var DBarray: [[Int]] = [[12,13], [19,20], [21], [22,23], [20]]
    
    func resetArray(){
        attractionImages.removeAll()
        attractionImages2.removeAll()
        attractionNames.removeAll()
        attractionNames2.removeAll()
        attractionTimes.removeAll()
        attractionTimes2.removeAll()
    }
    func appendArray(){
        for var x = 0; x < DBarray.count; x++ {
            DBarray[x].append(x)
        }
    }
    
    func sortTime(){
        
        var xIndex = [Int]()
        let array = DBarray.sort { ($0[0] as? Int) < ($1[0] as? Int) }
        for var x = 0; x < array.count; x++ {
            for var y = 0; y < array[x].count-1; y++ {
                let timeStart:Int = array[x][0]
                let time:Int = array[x][y]
                var timeEnd:Int = timeStart + array[x].count-1
                if timeEnd > 12{
                    timeEnd = timeEnd - 12
                }
                if (dateComponents.hour == time){
                    xIndex.append(x)
                    if (timeStart == 12){
                        attractionTimes.append("\(timeStart) pm - \(timeEnd) pm")
                        attractionNames.append(specialsArray[array[x][array[x].count-1]])
                        attractionImages.append(specialsImages[array[x][array[x].count-1]])
                    }
                    else if (timeStart > 12){
                        current = timeStart - 12
                        attractionTimes.append("\(current) pm - \(timeEnd) pm")
                        attractionNames.append(specialsArray[array[x][array[x].count-1]])
                        attractionImages.append(specialsImages[array[x][array[x].count-1]])
                    }
                    else {
                        attractionTimes.append("\(timeStart) am - \(timeEnd) am")
                        attractionNames.append(specialsArray[array[x][array[x].count-1]])
                        attractionImages.append(specialsImages[array[x][array[x].count-1]])
                    }
                    //attractionImages.append("profile.png")
                    //                cells1++
                }
            }
        }
        
        
        
        for var x = 0; x < array.count; x++ {
            for var y = 0; y < array[x].count-1; y++ {
                let timeStart:Int = array[x][0]
                let time:Int = array[x][y]
                var timeEnd:Int = timeStart + array[x].count-1
                if (y == 0) {
                    if xIndex.contains(x){
                        print(x)
                    }
                    else{
                        if (timeEnd - 1 > dateComponents.hour){
                            if timeEnd > 12{
                                timeEnd = timeEnd - 12
                            }
                            if (timeStart == 12){
                                if timeEnd > 12{
                                    timeEnd = timeEnd - 12
                                    attractionTimes2.append("\(timeStart) pm - \(timeEnd) am")
                                    attractionNames2.append(specialsArray[array[x][array[x].count-1]])
                                    attractionImages2.append(specialsImages[array[x][array[x].count-1]])
                                }
                                else{
                                    attractionTimes2.append("\(timeStart) pm - \(timeEnd) pm")
                                    attractionNames2.append(specialsArray[array[x][array[x].count-1]])
                                    attractionImages2.append(specialsImages[array[x][array[x].count-1]])
                                }
                            }
                            else if (timeStart > 12){
                                current2 = time - 12
                                if timeEnd > 12{
                                    timeEnd = timeEnd - 12
                                    attractionTimes2.append("\(current2) pm - \(timeEnd) am")
                                    attractionNames2.append(specialsArray[array[x][array[x].count-1]])
                                    attractionImages2.append(specialsImages[array[x][array[x].count-1]])
                                }
                                else{
                                    attractionTimes2.append("\(current2) pm - \(timeEnd) pm")
                                    attractionNames2.append(specialsArray[array[x][array[x].count-1]])
                                    attractionImages2.append(specialsImages[array[x][array[x].count-1]])
                                }
                            }
                            else {
                                attractionNames2.append("\(timeStart) am - \(timeEnd) am")
                                attractionNames2.append(specialsArray[array[x][array[x].count-1]])
                                attractionImages2.append(specialsImages[array[x][array[x].count-1]])
                            }
                            //attractionImages.append("profile.png")
                        }
                    }
                }
            }
        }
        if attractionNames.count==0{
            attractionImages.append("")
            attractionNames.append("There are no specials happening right now!")
            attractionTimes.append("")
        }
    }
    
    
    func refresh(sender:AnyObject)
    {
        // Updating your data here...
        resetArray()
        appendArray()
        sortTime()
        
        self.tableView.reloadData()
        self.refreshControl?.endRefreshing()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.refreshControl?.addTarget(self, action: "refresh:", forControlEvents: UIControlEvents.ValueChanged)
        appendArray()
        sortTime()

       
        
//        attractionNames = ["$4 COLLEGE MARGARITAS",
//            "$3 CALLS\n$4 WELLS",
//            "$7 PITCHERS OF PBR",
//            "FISHBOWLS ALL NIGHT",
//            "FREE LAP DANCES"]
//        
//        attractionNames2 = ["$2 WELL TEQUILA SHOTS",
//            "$2 OLD ENGLISH 40'S",
//            "$4.50 ALL MICROBREWS",
//            "LADIES DRINK FREE",
//            "$30 PRIVATE ROOM SPECIALS"]
//        
//        
//        attractionImages = ["awesome-circle-tattoo-design2",
//            "saloon4",
//            "sd2",
//            "bottle3",
//            "stripper 3"]
        
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
                        return "H A P P E N I N G   N O W"
                    }
                    if (section == 1){
                        return "L A T E R   T O N I G H T"
                    }
                    return nil
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell =
        self.tableView.dequeueReusableCellWithIdentifier(
            "AttractionTableCell", forIndexPath: indexPath)
            as! AttractionTableViewCell
        
        let backgroundImage = UIImage(named: "blued.jpg")
        let imageView = UIImageView(image: backgroundImage)
        self.tableView.backgroundView = imageView
        tableView.tableFooterView = UIView(frame: CGRectZero)
        imageView.contentMode = .ScaleAspectFill
        
        self.tableView.separatorColor = UIColor.grayColor()
        tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0)
        

        
        if (indexPath.section == 0){
            cell.attractionLabel.text = attractionNames[indexPath.row]
            cell.attractionTime.text = attractionTimes[indexPath.row]
            cell.imageView!.image = UIImage(named: attractionImages[indexPath.row])
            //cell.attractionImage.image = UIImage(named: attractionImages[indexPath.row])
            
        }
        if (indexPath.section == 1){
            cell.attractionLabel.text = attractionNames2[indexPath.row]
            cell.attractionTime.text = attractionTimes2[indexPath.row]
            cell.imageView!.image = UIImage(named: attractionImages2[indexPath.row])
            //cell.attractionImage.image = UIImage(named: attractionImages2[indexPath.row])
            
        }
        return cell
    }


    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let headerview = view as! UITableViewHeaderFooterView
        headerview.textLabel
        headerview.textLabel?.font = UIFont(name: "Helvetica Neue", size: 14)
        headerview.textLabel?.textColor = .whiteColor()
        headerview.textLabel?.textAlignment = NSTextAlignment.Center
        headerview.backgroundColor = .clearColor()
        headerview.tintColor = .clearColor()
       
        
        
        
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
