//
//  RootWireframe.swift
//  LoginTest
//
//  Created by Bogdan Sasko on 2/14/18.
//  Copyright © 2018 Константин. All rights reserved.
//

import UIKit

class RootWireframe: NSObject {
    let splashScreenWireframe: SplashWireframe?
    var homeRouter: HomeWireframe?
    
    override init() {
        self.splashScreenWireframe = SplashWireframe.sharedInstance
    }
    
    func application(didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?, window: UIWindow) -> Bool {
        self.splashScreenWireframe?.window = window
        self.homeRouter = HomeWireframe()
        self.homeRouter?.window = window
        self.checkUserIsExists()
        return true
    }
    
    func checkUserIsExists() {
        if DataStore.defaultLocalDB.checkUserAbility() {
            self.homeRouter?.presentHomeViewControllerInWindow()
        } else {
    
            self.splashScreenWireframe?.presentSplashScreenControllerInWindow()
        }
    }
}

