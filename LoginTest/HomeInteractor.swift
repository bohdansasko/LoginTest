
//
//  HomeInteraptor.swift
//  LoginTest
//
//  Created by Bogdan Sasko on 2/14/18.
//  Copyright © 2018 Константин. All rights reserved.
//

import Foundation

class HomeInteractor: NSObject, HomeInteractorProtocol {
    func deleteUser() {
        DataStore.defaultLocalDB.deleteUser()
    }

}