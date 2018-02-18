//
//  SignupWireframe.swift
//  LoginTest
//
//  Created by Bogdan Sasko on 2/14/18.
//  Copyright © 2018 Константин. All rights reserved.
//

import UIKit

class SignupWireframe: NSObject, SignupWireframeProtocol {
    var signupViewController: SignUpViewController?
    
    func dismissSignupViewController() {
        signupViewController?.dismiss(animated: true, completion: nil)
    }
    func presentHomeScreen() {
        let homeViewController = UIStoryboard.init(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
        homeViewController?.navigation = HomeWireframe()
        homeViewController?.navigation?.homeViewController = homeViewController
        homeViewController?.interactor = HomeInteractor()
        self.signupViewController?.present(homeViewController!, animated: true, completion: nil)
    }
}
