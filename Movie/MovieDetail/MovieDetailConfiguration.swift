//
//  MovieDetailConfiguration.swift
//  Movie
//
//  Created by Audhy Virabri Kressa on 28/11/22.
//

import Foundation
import MovieCore

class MovieDetailConfiguration {
    
    static func configureModule(movie: MovieModel, viewController: MovieDetailViewController) {
        let view = MovieDetailView()
        let router = MovieDetailRouterImplementation()

        let presenter = MovieDetailPresenterImplementation()

        viewController.movieDetailView = view
        viewController.router = router
        viewController.movie = movie
        
        presenter.viewController = viewController
        
    }
}
