//
//  SplashWireframe.swift
//  LoginTest
//
//  Created by Bogdan Sasko on 2/14/18.
//  Copyright © 2018 Константин. All rights reserved.
//

import UIKit

class SplashWireframe: NSObject, SplashWireframeProtocol {
    var splashScreenViewController: SplashViewController?
    var window: UIWindow?
    
    static var sharedInstance: SplashWireframe = {
        SplashWireframe()
    }()
    
    func presentSplashScreenControllerInWindow() {
        let splashViewController = UIStoryboard.init(name: "Splash", bundle: nil).instantiateViewController(withIdentifier: "SplashViewController") as? SplashViewController
        self.splashScreenViewController = splashViewController
        self.splashScreenViewController?.navigation = self
        self.window!.rootViewController = splashViewController
        self.window!.makeKeyAndVisible()
    }
    
    func presentLoginViewController() {
        let loginViewController = UIStoryboard.init(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
        
        loginViewController?.interactor = LoginInteractor()
        loginViewController?.interactor?.view = loginViewController
        loginViewController?.navigation = LoginWireframe()
        loginViewController?.navigation?.loginViewController = loginViewController
        
        self.splashScreenViewController?.present(loginViewController!, animated: true, completion: nil)
    }
    
    func presentSignupViewController() {
        let signupViewController = UIStoryboard.init(name: "Signup", bundle: nil).instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpViewController
        
        signupViewController?.interactor = SignupInteractor()
        signupViewController?.interactor?.view = signupViewController
        signupViewController?.navigation = SignupWireframe()
        signupViewController?.navigation?.signupViewController = signupViewController
        
        self.splashScreenViewController?.present(signupViewController!, animated: true, completion: nil)
    }
}
