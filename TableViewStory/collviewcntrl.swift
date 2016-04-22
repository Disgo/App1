//
//  collviewcntrl.swift
//  UI Collection View
//
//  Created by Technology, Arts & Media on 2/25/16.
//  Copyright © 2016 Disgo. All rights reserved.
//

import UIKit

class collviewcntrl: UICollectionViewController {
    
    var tableImages: [String] = ["tahona.png", "pressplay.png", "thewalrus.png", "boulderhouse.png", "biergarten.png", "therio.png", "thedowner.png"]
    
    var barNames: [String] = ["Tahona", "Press Play", "The Walrus", "Absinthe House", "Biergarten", "The Rio", "The Downer"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tableImages.count
        
        
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: ColViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! ColViewCell
        
        let backgroundImage = UIImage(named: "background4.png")
        let imageView = UIImageView(image: backgroundImage)
        self.collectionView!.backgroundView = imageView
        imageView.contentMode = .ScaleAspectFill
        
        cell.imgcell.image = UIImage (named: tableImages [indexPath.row])
        cell.imgLabel.text = barNames [indexPath.row]
        return cell
        
        
    }
override     
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("Cell \(indexPath.row) selected")
    
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SendDataSegue" {
            if let destination = segue.destinationViewController as? ProfileViewController {
                
                let cell = sender as! ColViewCell
                    destination.bar = cell.imgLabel.text!
            }
        }
    }
   

}
