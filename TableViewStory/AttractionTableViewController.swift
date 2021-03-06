//
//  AttractionTableViewController.swift
//  TableViewStory
//
//  Created by Kristof on 1/26/16.
//  Copyright © 2016 Kristof. All rights reserved.
//

import UIKit
import Firebase



class AttractionTableViewController: UITableViewController {
    
    // Create a reference to a Firebase location
    var myRootRef = Firebase(url:"https://glaring-inferno-9037.firebaseio.com/")
    
    
    /*Initialize NSDate to get the Day, Month, Year, Week of Year, Hour, Minute, Second, and Nanosecond*/
    
    let currentDate = NSDate()
    let calendar = NSCalendar.currentCalendar()
    let dateComponents = NSCalendar.currentCalendar().components([NSCalendarUnit.Day, NSCalendarUnit.Month, NSCalendarUnit.Year, NSCalendarUnit.WeekOfYear, NSCalendarUnit.Hour, NSCalendarUnit.Minute, NSCalendarUnit.Second, NSCalendarUnit.Nanosecond], fromDate: NSDate())
    
    /*Declare Variables and Arrays*/

    
    var attractionImages = [String]()
    var attractionImages2 = [String]()
    var attractionNames = [String]()
    var attractionNames2 = [String]()
    var attractionTimes = [String]()
    var attractionTimes2 = [String]()
    var attractionBars = [String]()
    var attractionBars2 = [String]()
    var barName = "From AttractionTableViewController"
    var times = [Int]()
    var current: Int = 0
    var current2: Int = 0
    var timesAppend: Int = 0
    var i: Int = 0
    
    /*Listed Specials*/

    
    /*
    var specialsArray:[String]
        = ["$4 COLLEGE MARGARITAS",
                "$3 CALLS\n$4 WELLS",
                "$7 PITCHERS OF PBR",
                "FISHBOWLS ALL NIGHT",
                "FREE LAP DANCES","FREE LAP DANCES","FREE LAP DANCES"]
  */
    /*Image Names*/
    
//    var specialsImages: [String] = ["thedowner",
//    "therio",
//    "biergarten",
//    "thewalrus",
//    "tahona",
//    "boulderhouse",
//    "pressplay"]
    
    /*Bar Names*/
    
//    var barNames: [String] = ["The Downer", "The Rio", "Bohemian Biergarten",
//        "The Walrus",
//        "Tahona",
//        "Boulder House",
//        "Press Play"]

    /*Hours that the special is going on (in military time)*/
    
    var DBarray = [[Int]]()

    //empty array
    
    var specialsArray = [String]()
    var specialsImages = [String]()
    var barNames = [String]()
    /*
    var specialsImages=[String]()
    var barNames=[String]()
    */
    
    /*Remove items from popluated arrays when table refreshed*/
    
    let ref = Firebase(url: "https://glaring-inferno-9037.firebaseio.com/")
    
//    func addData(){
//        var specialCount: Int = 0
//            ref.observeEventType(FEventType.Value, withBlock: {snapshot in
//                if let snapshots = snapshot.children.allObjects as? [FDataSnapshot]{
//                    for item in snapshots {
//                        specialCount++
//                        let specialName = item.value["name"] as? String
//                        _ = item.value["bar"] as? String
//                        _ = item.value["image"] as? String
//                        //self.specialsArray.append(specialName!)
//                        self.specialsArray[specialCount-1] = specialName!
//                    }
//                }
//                self.tableView.reloadData()
//            })
//    }
    
    func resetArray(){
        attractionImages.removeAll()
        attractionImages2.removeAll()
        attractionNames.removeAll()
        attractionNames2.removeAll()
        attractionTimes.removeAll()
        attractionTimes2.removeAll()
        attractionBars.removeAll()
        attractionBars2.removeAll()
    }
    
    /*Append index values to each sub-array*/
    
    func appendArray(){
        for var x = 0; x < DBarray.count; x++ {
            DBarray[x].append(x)
        }
    }
    
    /*Populate arrays based off date*/
    
//    func dateSort(){
//        if (dateComponents.day == 16){
//            DBarray = [[15,16], [20,21], [23], [21,22], [17]]
//        }
//        if (dateComponents.day == 17){
//            DBarray = [[13,14], [19,20], [15], [17,18], [18]]
//        }
//        if (dateComponents.day == 18){
//            DBarray = [[15,16], [20,21], [23], [21,22], [19]]
//        }
//        if (dateComponents.day == 19){
//            DBarray = [[15,16], [20,21], [23], [21,22], [20]]
//        }
//        if (dateComponents.day == 20){
//            DBarray = [[15,16], [20,21], [23], [21,22], [21]]
//        }
//        appendArray()
//    }
    
    /*Sort the specials by time*/
    
    func sortTime(){
        
        
        
        

        
        
        
        
        var xIndex = [Int]()
        
        /*Sort the DBArray numerically by first value in sub-array so that the specials are organized by time*/
        
        let array = DBarray.sort { ($0[0] as? Int) < ($1[0] as? Int) }
        
        /*Sort through the sub-arrays and add attraction names and times for the Happening Now section*/
        
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
                        attractionBars.append(barNames[array[x][array[x].count-1]])
                    }
                    else if (timeStart > 12){
                        current = time - 12
                        if timeEnd > 12{
                            timeEnd = timeEnd - 12
                            attractionTimes.append("\(current) pm - \(timeEnd) am")
                            attractionNames.append(specialsArray[array[x][array[x].count-1]])
                            attractionImages.append(specialsImages[array[x][array[x].count-1]])
                            attractionBars.append(barNames[array[x][array[x].count-1]])
                        }
                        else if timeEnd == 12{
                            attractionTimes.append("\(current) pm - \(timeEnd) am")
                            attractionNames.append(specialsArray[array[x][array[x].count-1]])
                            attractionImages.append(specialsImages[array[x][array[x].count-1]])
                            attractionBars.append(barNames[array[x][array[x].count-1]])
                        }
                        else{
                            attractionTimes.append("\(current) pm - \(timeEnd) pm")
                            attractionNames.append(specialsArray[array[x][array[x].count-1]])
                            attractionImages.append(specialsImages[array[x][array[x].count-1]])
                            attractionBars.append(barNames[array[x][array[x].count-1]])
                        }
                    }
                    else {
                        attractionTimes.append("\(timeStart) am - \(timeEnd) am")
                        attractionNames.append(specialsArray[array[x][array[x].count-1]])
                        attractionImages.append(specialsImages[array[x][array[x].count-1]])
                        attractionBars.append(barNames[array[x][array[x].count-1]])
                    }
                }
            }
        }
        
        /*Sort through the sub-arrays and add attraction names and times for the Later Tonight section*/
        
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
                                    attractionBars2.append(barNames[array[x][array[x].count-1]])
                                }
                                else{
                                    attractionTimes2.append("\(timeStart) pm - \(timeEnd) pm")
                                    attractionNames2.append(specialsArray[array[x][array[x].count-1]])
                                    attractionImages2.append(specialsImages[array[x][array[x].count-1]])
                                    attractionBars2.append(barNames[array[x][array[x].count-1]])
                                }
                            }
                            else if (timeStart > 12){
                                current2 = time - 12
                                if timeEnd > 12{
                                    timeEnd = timeEnd - 12
                                    attractionTimes2.append("\(current2) pm - \(timeEnd) am")
                                    attractionNames2.append(specialsArray[array[x][array[x].count-1]])
                                    attractionImages2.append(specialsImages[array[x][array[x].count-1]])
                                    attractionBars2.append(barNames[array[x][array[x].count-1]])
                                }
                                else if timeEnd == 12{
                                    attractionTimes2.append("\(current2) pm - \(timeEnd) am")
                                    attractionNames2.append(specialsArray[array[x][array[x].count-1]])
                                    attractionImages2.append(specialsImages[array[x][array[x].count-1]])
                                    attractionBars2.append(barNames[array[x][array[x].count-1]])
                                }
                                else{
                                    attractionTimes2.append("\(current2) pm - \(timeEnd) pm")
                                    attractionNames2.append(specialsArray[array[x][array[x].count-1]])
                                    attractionImages2.append(specialsImages[array[x][array[x].count-1]])
                                    attractionBars2.append(barNames[array[x][array[x].count-1]])
                                }
                            }
                            else {
                                attractionNames2.append("\(timeStart) am - \(timeEnd) am")
                                attractionNames2.append(specialsArray[array[x][array[x].count-1]])
                                attractionImages2.append(specialsImages[array[x][array[x].count-1]])
                                attractionBars2.append(barNames[array[x][array[x].count-1]])
                            }
                            //attractionImages.append("profile.png")
                        }
                    }
                }
            }
        }
        if attractionNames.count==0{
            attractionImages.append("")
            attractionNames.append("        There are no specials happening right now!")
            attractionTimes.append("")
        }
    }
    
    
    /*On pull to refresh reset the arrays and sort the time*/
    
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let headerview = view as! UITableViewHeaderFooterView
        headerview.textLabel
        headerview.textLabel?.font = UIFont(name: "Helvetica Neue", size: 20)
        headerview.textLabel?.textColor = .whiteColor()
        headerview.textLabel?.textAlignment = NSTextAlignment.Center
        headerview.backgroundColor = .clearColor()
        headerview.tintColor = .clearColor()
        
        
    }
    

    
    func refresh(sender:AnyObject)
    {
        // Updating your data here...
        resetArray()
        sortTime()
        
        self.tableView.reloadData()
        self.refreshControl?.endRefreshing()
    }
    
    
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        print("in viewwillappear")
        
        var specialCount: Int = 0
        ref.observeEventType(FEventType.Value, withBlock: {snapshot in
            self.specialsArray=[]
            self.specialsImages=[]
            self.barNames=[]
            self.DBarray=[]
            if let snapshots = snapshot.children.allObjects as? [FDataSnapshot]{
                for item in snapshots {
                    specialCount++
                    let specialName = item.value["name"] as? String
                    let specialBar = item.value["bar"] as? String
                    let specialImage = item.value["image"] as? String
                    let startTime = item.value["start"] as? Int
                    let endTime = item.value["end"] as? Int
                    
                    var timeDiff = endTime! - startTime!
                    
                    if timeDiff == 1 {
                        var row = [Int]()
                        row.append(startTime!)
                        self.DBarray.append(row)
                    }
                    else {
                        var row2 = [Int]()
                        for var x = 0; x < timeDiff; x++ {
                            row2.append(startTime! + x)
                        }
                        self.DBarray.append(row2)
                    }
                    
                    
                    self.specialsArray.append(specialName!)
                    self.specialsImages.append(specialImage!)
                    self.barNames.append(specialBar!)
                    //self.specialsArray[specialCount-1] = specialName!
                }
            }
            self.resetArray()
            self.appendArray()
            self.sortTime()
            print(self.specialsArray)
            self.tableView.reloadData()
        })
        /*
        //from viewdidload
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            // load data
            dispatch_async(dispatch_get_main_queue()) {
                // update ui
            }
        }
        
        self.refreshControl?.addTarget(self, action: "refresh:", forControlEvents: UIControlEvents.ValueChanged)
        refreshControl?.tintColor = UIColor.whiteColor()
        
*/
        
        /*When the screen loads populate array and sort specials*/
        
        //appendArray()
        //sortTime()

        //end from viewdidload
    }
    
    
    override func viewDidLoad() {
        print("in viewdidload")
        super.viewDidLoad()

        
        self.refreshControl?.addTarget(self, action: "refresh:", forControlEvents: UIControlEvents.ValueChanged)
        refreshControl?.tintColor = UIColor.whiteColor()
        
        /*When the screen loads populate array and sort specials*/
        
        

        tableView.estimatedRowHeight = 50
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        print("in numberofsections")
        /*Two sections "Happening Now" and "Later Tonight"*/
        
        return 2
    }
    
    var numberOfRowsAtSection: [Int] = []
    var rows: Int = 0
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        numberOfRowsAtSection = [attractionNames.count,attractionNames2.count]
        rows = numberOfRowsAtSection[section]
        print("in tableview numberofrowsinsection \(rows)")
        return rows
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        /*Header Titles*/
        
        if (section == 0){
            return "H A P P E N I N G   N O W"
        }
        if (section == 1){
            return "L A T E R   T O N I G H T"
        }
        return nil
        
        
 }
    
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        print("in tableview cellforrowatindexpath")
        let cell =
        self.tableView.dequeueReusableCellWithIdentifier(
            "AttractionTableCell", forIndexPath: indexPath)
            as! AttractionTableViewCell
        
        /*Background Image*/
        
        let backgroundImage = UIImage(named: "background4.png")
        let imageView = UIImageView(image: backgroundImage)
        self.tableView.backgroundView = imageView
        tableView.tableFooterView = UIView(frame: CGRectZero)
        imageView.contentMode = .ScaleAspectFill
        
        
        tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0)
        self.tableView.backgroundView?.layer.zPosition -= +1

        
        if (indexPath.section == 0){
            
            /*If there are no specials happening right now, create cell that says there are no cells*/
            
            if attractionNames.count==0{
                attractionImages.append("")
                attractionNames.append("There are no specials happening right now!")
                attractionTimes.append("")
            }
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
        print(cell.attractionLabel.text)
        return cell
    }



    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SendDataSegue" {
            if let destination = segue.destinationViewController as? ProfileViewController {
                
                let path = tableView.indexPathForSelectedRow
                let cell = tableView.cellForRowAtIndexPath(path!)
                if (path!.section == 0){
                    destination.bar = (attractionBars[path!.row])
                }
                if (path!.section == 1){
                    destination.bar = (attractionBars2[path!.row])
                }
                
            }
        }
    }
    
//    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerview = UITableViewHeaderFooterView()
//        let myView = UIImageView(frame: CGRectMake(10, -10, 40, 40));
//        let myImage = UIImage(named: "line2")
//        myView.image = myImage
//        headerview.addSubview(myView)
//        return headerview
//    }
    
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
