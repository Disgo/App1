//
//  RegisterViewController.swift
//  TableViewStory
//
//  Created by Technology, Arts, & Media on 3/31/16.
//  Copyright © 2016 Kristof. All rights reserved.
//

import UIKit
import Firebase

var createEmail = ""
var createPass = ""

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var registerEmail: UITextField!
    
    @IBOutlet weak var registerPassword: UITextField!
    
    @IBAction func createAccount(sender: AnyObject) {
        
        createEmail = registerEmail.text!
        createPass = registerPassword.text!
        
        let ref = Firebase(url: "https://glaring-inferno-9037.firebaseio.com/")
        ref.createUser(createEmail, password: createPass,
            withValueCompletionBlock: { error, result in
                if error != nil {
                    // There was an error creating the account
                } else {
                    let uid = result["uid"] as? String
                    print("Successfully created user account with uid: \(uid)")
                    self.performSegueWithIdentifier("accountRegistered", sender: sender)
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
