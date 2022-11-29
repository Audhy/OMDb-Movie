//
//  MovieRouter.swift
//  Movie
//
//  Created by Audhy Virabri Kressa on 28/11/22.
//

import Foundation
import UIKit
import MovieCore

protocol MovieRouter: class {
    var navigationController: UINavigationController? { get }
    
    func routeToDetail(with movie: MovieModel)
}

class MovieRouterImplementation: MovieRouter {
    weak var navigationController: UINavigationController?
    
    func routeToDetail(with movie: MovieModel) {
        let viewController = MovieDetailViewController()
        MovieDetailConfiguration.configureModule(movie: movie, viewController: viewController)
        
        self.navigationController?.pushViewController(viewController, animated: true)
        
        
    }
  
}
