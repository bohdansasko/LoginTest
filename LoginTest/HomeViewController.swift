    //
//  HomeViewController.swift
//  LoginTest
//
//  Created by Bogdan Sasko on 2/12/18.
//  Copyright © 2018 Константин. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    var interactor: HomeInteractor?
    var navigation: HomeWireframe?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapLogoutBtn(sender: AnyObject) {
        self.navigation?.dismissHomeViewController()
    }

    @IBAction func didTapDeleteUserBtn(sender: AnyObject) {
        self.interactor?.deleteUser()
        self.navigation?.dismissHomeViewController()
    }

}
