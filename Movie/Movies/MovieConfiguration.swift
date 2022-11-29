//
//  MovieConfiguration.swift
//  Movie
//
//  Created by Audhy Virabri Kressa on 28/11/22.
//

import Foundation
import MovieCore

class MovieConfigurator {
    
    static func configureModule(movieTitle: String, movieYear: String?, movieType: String?, movies: SearchModel, viewController: MovieViewController) {
        let view = MovieView()
        let router = MovieRouterImplementation()
        let interactor = MovieInteractorImplementation(movieService: MovieServiceImplementation(), searchService: SearchServiceImplementation())
        let presenter = MoviePresenterImplementation()
        
        viewController.movieView = view
        viewController.router = router
        viewController.interactor = interactor
        viewController.movies = movies
        viewController.movieTitle = movieTitle
        viewController.movieYear = movieYear
        viewController.movieType = movieType

        interactor.presenter = presenter
        
        presenter.viewController = viewController
        
        router.navigationController = viewController.navigationController
    }
}
