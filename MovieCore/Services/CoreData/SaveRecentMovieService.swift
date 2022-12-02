//
//  RecentMovieService.swift
//  MovieCore
//
//  Created by Audhy Virabri Kressa on 02/12/22.
//

import Foundation
import CoreData

public protocol SaveRecentMovieServiceable {
    func save(movie: MovieModel, onSuccess: @escaping(Bool) -> Void)
}

public class SaveRecentMovieServiceCoreData: SaveRecentMovieServiceable {
    
    public init() {}
    
    public func save(movie: MovieModel,  onSuccess: @escaping (Bool) -> Void){
        if #available(iOS 13.0, *) {
            let dataController = DataController()
            let managedContext = dataController.container.viewContext
            
            let installedEntity = NSEntityDescription.entity(forEntityName: "Recent", in: managedContext)!
            
            let installedData = NSManagedObject(entity: installedEntity, insertInto: managedContext)
            installedData.setValue(movie.imdbID, forKey: "imdbID")
            installedData.setValue(movie.title, forKey: "title")
            installedData.setValue(movie.poster, forKey: "poster")
            installedData.setValue(movie.type, forKey: "type")
            installedData.setValue(movie.year, forKey: "year")

            
            //Save and catch error
            do{
                try managedContext.save()
                onSuccess(true)
            } catch let error as NSError{
                onSuccess(false)

                print("could not save. \(error),\(error.userInfo)")
            }
        } else {
            onSuccess(false)
        }

      
        
    }
    
}


