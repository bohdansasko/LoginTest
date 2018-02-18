//
//  LoginInteractor.swift
//  LoginTest
//
//  Created by Bogdan Sasko on 2/14/18.
//  Copyright © 2018 Константин. All rights reserved.
//

import Foundation

class LoginInteractor: NSObject, LoginInteractorProtocol {
    var view: LoginViewController?
    
    func loginUser(userModel: UserModel) {
        view?.loginUser(
            isSaved: DataStore.defaultLocalDB.loginUser(userModel: userModel)
        )
    }
}
