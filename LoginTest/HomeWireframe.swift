//
//  HomeWireframe.swift
//  LoginTest
//
//  Created by Bogdan Sasko on 2/14/18.
//  Copyright © 2018 Константин. All rights reserved.
//

import UIKit

class HomeWireframe: NSObject, HomeWireframeProtocol {
    var homeViewController: HomeViewController?
    var splashNavigation: SplashWireframe?
    var window: UIWindow?
    
    func presentHomeViewControllerInWindow() {
        let homeViewController = UIStoryboard.init(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
        self.homeViewController = homeViewController
        self.homeViewController?.navigation = self
        self.homeViewController?.interactor = HomeInteractor()
        self.window!.rootViewController = homeViewController
        self.window!.makeKeyAndVisible()
    }
    
    func dismissHomeViewController() {
        self.homeViewController?.dismiss(animated: true, completion: nil)
        self.splashNavigation = SplashWireframe.sharedInstance
        self.splashNavigation?.presentSplashScreenControllerInWindow()
    }
}
