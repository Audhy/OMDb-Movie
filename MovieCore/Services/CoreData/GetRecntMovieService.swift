//
//  GetRecntMovieService.swift
//  MovieCore
//
//  Created by Audhy Virabri Kressa on 02/12/22.
//

import Foundation
import CoreData

public protocol GetRecntMovieServiceable {
    func fetch(onSuccess: @escaping([Search]) -> Void)
}

public class GetRecntMovieService: GetRecntMovieServiceable {
    
    public init() {}
    
    public func fetch(onSuccess: @escaping ([Search]) -> Void) {
        if #available(iOS 13.0, *) {
            let dataController = DataController()
            
            let managedContext = dataController.container.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Recent")
            do{
                let result = try managedContext.fetch(fetchRequest)
                
                var movies:[Search] = []
                for data in result as! [NSManagedObject]{
                    var temp = Search()
                    temp.imdbID = data.value(forKey: "imdbID") as? String ?? ""
                    temp.title = data.value(forKey: "title") as? String ?? ""
                    temp.poster = data.value(forKey: "poster") as? String ?? ""
                    temp.type = data.value(forKey: "type") as? String ?? ""
                    temp.year = data.value(forKey: "year") as? String ?? ""
                    movies.append(temp)
                }
                onSuccess(movies)
            } catch {
                onSuccess([])
                
            }
        } else {
            onSuccess([])
        }
        
        
    }
    
    
    
}

