//
//  CoreDataEngine.swift
//  LoginTest
//
//  Created by Bogdan Sasko on 2/12/18.
//  Copyright © 2018 Константин. All rights reserved.
//

import Foundation
import CoreData

class CoreDataEngine {
    static var sharedInstance: CoreDataEngine = {
        CoreDataEngine()
    }()
    
    var moc = NSManagedObjectContext(concurrencyType: NSManagedObjectContextConcurrencyType.mainQueueConcurrencyType)
    
    init() {
        moc = CoreDataManager.sharedInstance.persistentContainer.viewContext
    }
    
    func createUser(userModel: UserModel) -> Bool {
        guard let entityDescription = NSEntityDescription.entity(forEntityName: "User", in: moc) else {
            return false
        }
        let user = User(entity: entityDescription, insertInto: moc)

        user.setValue(userModel.username, forKey: "name")
        user.setValue(userModel.password, forKey: "password")

        do {
            try moc.save()
            print("-- User got saved --")
            return true
        } catch {
            let nsError = error as NSError
            NSLog("Unresolved error \(nsError), \(nsError.userInfo)")
        }

        return false
    }


    func checkUserAbility() -> Bool {
        let entityDescription = NSEntityDescription.entity(forEntityName: "User", in: moc)
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest()
        fetchRequest.entity = entityDescription

        do {
            let result = try moc.fetch(fetchRequest)
            if (result.count == 0) {
                print("\n\nData got empty values")
                return false
            } else {
                return true
            }
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }

        return false
    }

    func loginUser(userModel: UserModel) -> Bool {
        let entityDescription = NSEntityDescription.entity(forEntityName: "User", in: moc)
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest()
        fetchRequest.predicate = NSPredicate(format: "%K==%@", "name", userModel.username)
        fetchRequest.entity = entityDescription

        do {
            let result = try moc.fetch(fetchRequest)
            if (result.count == 1) {
                return true
            }

            return false
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }

        return false
    }

    func deleteUser() {
        let entityDescription = NSEntityDescription.entity(forEntityName: "User", in: moc)
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest()
        fetchRequest.entity = entityDescription

        do {
            let result = try moc.fetch(fetchRequest)
            if (result.count == 0) {
                print("There's no users to logout!")
                return
            }

            let maagedObject = result.first
            moc.delete(maagedObject as! User)
            try moc.save()
            print("User deleted")
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
}
