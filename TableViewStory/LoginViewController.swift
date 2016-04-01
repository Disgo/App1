//
//  LoginViewController.swift
//  TableViewStory
//
//  Created by Technology, Arts, & Media on 3/31/16.
//  Copyright © 2016 Kristof. All rights reserved.
//

import UIKit
import Firebase

var email = ""
var pass = ""


class LoginViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBAction func loginButton(sender: AnyObject) {
        email = username.text!
        pass = password.text!
        
        let ref = Firebase(url: "https://glaring-inferno-9037.firebaseio.com/")
        ref.authUser(email, password: pass,
            withCompletionBlock: { error, authData in
                
                if error != nil {
                    self.username.text = ""
                    self.password.text = ""
                    // There was an error logging in to this account
                } else {
                    self.performSegueWithIdentifier("homeScreen", sender: sender)
                    // We are now logged in
                }
        })
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
