//
//  HomeViewController.swift
//  LoginTest
//
//  Created by Bogdan Sasko on 2/12/18.
//  Copyright © 2018 Константин. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapLogoutBtn(sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func didTapDeleteUserBtn(sender: AnyObject) {
        DataStore.defaultLocalDB.deleteUser()
        self.dismiss(animated: true, completion: nil)
    }

}
