//
//  SignUpViewController.swift
//  LoginTest
//
//  Created by Bogdan Sasko on 2/12/18.
//  Copyright © 2018 Константин. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func didTapSingupButton(sender: AnyObject) {
        var inputDict = [String:AnyObject]()
        inputDict["name"] = self.nameTextField.text as AnyObject
        inputDict["password"] = self.passwordTextField.text as AnyObject
        let userModel = UserModel(inputDictionary: inputDict)
        createUser(userModel: userModel)
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func didTapDismissButton(sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }

    func createUser(userModel: UserModel) {
        userCreatingShow(DataStore.defaultLocalDB.createUser(userModel: userModel))
    }

    func userCreatingShow(_ isSaved: Bool) {
        if isSaved {
            print("Success: user created")
        } else {
            print("Failure: user didn't store")
        }
    }

}
