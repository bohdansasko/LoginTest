//
//  SignUpViewController.swift
//  LoginTest
//
//  Created by Bogdan Sasko on 2/12/18.
//  Copyright © 2018 Константин. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    var navigation: SignupWireframe?
    var interactor: SignupInteractor?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didTapSingupButton(sender: AnyObject) {
        var inputDict = [String:AnyObject]()
        inputDict["name"] = self.nameTextField.text as AnyObject
        inputDict["password"] = self.passwordTextField.text as AnyObject
        let userModel = UserModel(inputDictionary: inputDict)
        self.interactor?.createUser(userModel: userModel)
        
        navigation?.presentHomeScreen()
    }

    @IBAction func didTapDismissButton(sender: AnyObject) {
        navigation?.dismissSignupViewController()
    }

    func userCreatingShow(_ isSaved: Bool) {
        if isSaved {
            print("Success: user created")
            self.navigation?.presentHomeScreen()
        } else {
            print("Failure: user didn't store")
        }
    }

}
