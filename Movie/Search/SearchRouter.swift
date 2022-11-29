//
//  SearchRouterImplementation.swift
//  Movie
//
//  Created by Audhy Virabri Kressa on 28/11/22.
//

import Foundation
import MovieCore
import UIKit

protocol SearchRouter: class {
    var navigationController: UINavigationController? { get }
    
    func routeToMovies(movieTitle: String, movieYear: String?, movieType: String?, movies: SearchModel)
}

class SearchRouterImplementation: SearchRouter {
    weak var navigationController: UINavigationController?
    
    func routeToMovies(movieTitle: String, movieYear: String?, movieType: String?, movies: SearchModel) {

        let vc = MovieViewController()
        MovieConfigurator.configureModule(movieTitle: movieTitle, movieYear: movieYear, movieType: movieType, movies: movies,
                                                viewController: vc)
        navigationController?.pushViewController(vc, animated: true)
    }

}
