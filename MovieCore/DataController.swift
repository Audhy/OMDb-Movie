//
//  DataController.swift
//  MovieCore
//
//  Created by Audhy Virabri Kressa on 02/12/22.
//

import CoreData
import Foundation

class NSCustomPersistentContainer: NSPersistentContainer {

    override open class func defaultDirectoryURL() -> URL {
        var storeURL = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: MovieConstant.uniqueAccessGroup)
        storeURL = storeURL?.appendingPathComponent("Movie.sqlite")
        return storeURL!
    }

}

@available(iOS 13.0, *)
class DataController: ObservableObject {
    let container = NSCustomPersistentContainer(name: "Movie")

    init() {
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
