//
//  User+CoreDataProperties.swift
//  LoginTest
//
//  Created by Bogdan Sasko on 2/13/18.
//  Copyright © 2018 Константин. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: String?
    @NSManaged public var password: String?

}
