
//
//  SignupInteractor.swift
//  LoginTest
//
//  Created by Bogdan Sasko on 2/14/18.
//  Copyright © 2018 Константин. All rights reserved.
//

import Foundation

class SignupInteractor: NSObject, SignupInteractorProtocol {
    var view: SignUpViewController?
    
    func createUser(userModel: UserModel) {
        view?.userCreatingShow(DataStore.defaultLocalDB.createUser(userModel: userModel))
    }
}
