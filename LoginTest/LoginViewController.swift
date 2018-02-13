//
//  LoginViewController.swift
//  LoginTest
//
//  Created by Bogdan Sasko on 2/12/18.
//  Copyright © 2018 Константин. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
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
        loginUserWithModel(userModel: userModel)
    }

    @IBAction func didTapDissmisButton(sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }

    func loginUserWithModel(userModel: UserModel) {
        if DataStore.defaultLocalDB.loginUser(userModel: userModel) {
            print("Success: user logged")
            let homeViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as!
                HomeViewController
            self.present(homeViewController, animated: true, completion: nil)
        } else {
            print("Failure: user don't have in store")
        }
    }
}
