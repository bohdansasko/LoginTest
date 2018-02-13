//
//  User.swift
//  LoginTest
//
//  Created by Bogdan Sasko on 2/12/18.
//  Copyright © 2018 Константин. All rights reserved.
//

import Foundation

class UserModel {
    var inputDictionary = Dictionary<String, AnyObject>()
    
    convenience init(inputDictionary: Dictionary<String, AnyObject>) {
        self.init()
        self.inputDictionary = inputDictionary;
    }
    
    var username: String {
        set {
            inputDictionary["name"] = newValue as AnyObject
        }
        get {
            return (inputDictionary["name"] as? String)!
        }
    }
    
    var password: String {
        set {
            inputDictionary["password"] = newValue as AnyObject
        }
        get {
            return (inputDictionary["password"] as? String)!
        }
    }
}
