//
//  ViewController.swift
//  FashionableMe
//
//  Created by adi on 17/11/15.
//
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit

class ViewController: UIViewController , FBSDKLoginButtonDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        if FBSDKAccessToken.currentAccessToken() == nil {
            print("not logged in")
        } else {
            print("logged in")
        }
        var loginButton = FBSDKLoginButton()
        loginButton.readPermissions = ["public_profile","email","user_friends"]
        loginButton.center = self.view.center
        loginButton.delegate = self
        self.view.addSubview(loginButton)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        if error == nil {
            print("Login Complete")
            self.performSegueWithIdentifier("showNew", sender: self)
        } else {
            error.localizedDescription
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
    print("User logged out")
    }
    
    
    
    
    
    
    
    
    


}

