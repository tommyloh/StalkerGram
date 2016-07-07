//
//  ViewController.swift
//  instagram
//
//  Created by Tommy Loh on 04/07/2016.
//  Copyright © 2016 Tommy Loh. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
 

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
   
    @IBAction func onLoginButtonPressed(sender: AnyObject) {
        
        guard let email = userNameTextField.text, let password = passwordTextField.text else{
            return
    }

        FIRAuth.auth()?.signInWithEmail(email, password: password) { (user, error) in
            if let user = user {
                
                User.signIn(user.uid)
                self.performSegueWithIdentifier("HomeSegue", sender: nil)
            }else{
                let controller = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .Alert)
                let dismissButton = UIAlertAction(title: "Try Again", style: .Default, handler: nil)
                controller.addAction(dismissButton)
                
                self.presentViewController(controller, animated: true, completion: nil)
            }
        }

    }
    
    
    @IBAction func backToLogin(segue: UIStoryboardSegue){
        
    }
    
}


