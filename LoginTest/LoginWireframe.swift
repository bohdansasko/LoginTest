//
//  LoginWireframe.swift
//  LoginTest
//
//  Created by Bogdan Sasko on 2/14/18.
//  Copyright © 2018 Константин. All rights reserved.
//

import UIKit

class LoginWireframe: NSObject, LoginWireframeProtocol {
    var loginViewController: LoginViewController?
    
    func dismissLoginViewController() {
        loginViewController?.dismiss(animated: true, completion: nil)
    }
    func presentHomeScreen() {
        let homeViewController = UIStoryboard.init(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
        homeViewController?.navigation = HomeWireframe()
        homeViewController?.navigation?.homeViewController = homeViewController
        homeViewController?.interactor = HomeInteractor()
        self.loginViewController?.present(homeViewController!, animated: true, completion: nil)
    }
}
