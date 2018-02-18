//
//  SplashViewController.swift
//  LoginTest
//
//  Created by Bogdan Sasko on 2/12/18.
//  Copyright © 2018 Константин. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    var navigation: SplashWireframe?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapSignupButton(sender: AnyObject) {
        navigation?.presentSignupViewController()
    }

    @IBAction func didTapLoginButton(sender: AnyObject) {
        navigation?.presentLoginViewController()
    }

}
