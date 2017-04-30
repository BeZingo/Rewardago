//
//  ViewController.swift
//  Rewardago
//
//  Created by Hassanain Anver on 3/17/17.
//  Copyright © 2017 BeZingo Media. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var loginUsername: UITextField!
    @IBOutlet weak var loginPassword: UITextField!
    @IBOutlet weak var loginForgotPassword: UIButton!
    @IBOutlet weak var loginSignIn: UIButton!
    @IBOutlet weak var loginFBSignIn: UIButton!
    @IBOutlet weak var LoginCreateAccount: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    //Login Button for normal sign in
    @IBAction func loginSignIn(_ sender: UIButton) {
    }
    
    //Login Button for facebook sign in
    @IBAction func loginFBButtonClicked(_ sender: UIButton) {
        
    }


    
}

