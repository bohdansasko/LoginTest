//
//  LoginViewController.swift
//  LoginTest
//
//  Created by Bogdan Sasko on 2/12/18.
//  Copyright © 2018 Константин. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    var navigation: LoginWireframe?
    var interactor: LoginInteractor?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didTapLoginButton(sender: AnyObject) {
        var inputDict = [String:AnyObject]()
        inputDict["name"] = nameTextField.text as AnyObject
        inputDict["password"] = passwordTextField.text as AnyObject
        let userModel = UserModel(inputDictionary: inputDict)
        
        self.interactor?.loginUser(userModel: userModel)
    }

    @IBAction func didTapDissmisButton(sender: AnyObject) {
        navigation?.dismissLoginViewController()
    }

    func loginUser(isSaved: Bool) {
        if isSaved {
            print("Success: user logged")
            navigation?.presentHomeScreen()
        } else {
            print("Failure: user don't have in store")
        }
    }
}
