//
// Created by Bogdan Sasko on 2/13/18.
// Copyright (c) 2018 Константин. All rights reserved.
//

import Foundation

class DataStore {
    static var defaultLocalDB: CoreDataEngine {
        return CoreDataEngine.sharedInstance
    }
}