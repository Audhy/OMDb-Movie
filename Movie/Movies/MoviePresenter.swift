//
//  MoviePresenter.swift
//  Movie
//
//  Created by Audhy Virabri Kressa on 28/11/22.
//

import Foundation
import MovieCore

protocol MoviePresenter: class {
    func interactor(didRetrieveMovies movies: SearchModel)
    func interactor(didFailRetrieveMovies error: Error)
    func interactor(didObtainMovie movie: MovieModel)
    func interactor(didFailObtainMovie error: Error)

}

class MoviePresenterImplementation: MoviePresenter {
    
    func interactor(didRetrieveMovies movies: SearchModel) {
        viewController?.presenter(didRetrieveMovies: movies)
    }
    
    func interactor(didFailRetrieveMovies error: Error) {
        viewController?.presenter(didFailRetrieveMovies: error.localizedDescription)
    }
    
    func interactor(didObtainMovie movie: MovieModel) {
        viewController?.presenter(didObtainMovie: movie)
    }

    func interactor(didFailObtainMovie error: Error) {
        viewController?.presenter(didFailRetrieveMovies: error.localizedDescription)
    }

    weak var viewController: MoviePresenterOutput?
    
   
}
