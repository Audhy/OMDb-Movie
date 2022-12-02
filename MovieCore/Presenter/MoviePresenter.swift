//
//  MoviePresenter.swift
//  Movie
//
//  Created by Audhy Virabri Kressa on 28/11/22.
//

import Foundation
import MovieCore

public protocol MoviePresenter: class {
     func interactor(didRetrieveMovies movies: SearchModel)
     func interactor(didFailRetrieveMovies error: Error)
     func interactor(didObtainMovie movie: MovieModel)
     func interactor(didFailObtainMovie error: Error)

}

public class MoviePresenterImplementation: MoviePresenter {
    public init() {}
    public func interactor(didRetrieveMovies movies: SearchModel) {
        viewController?.presenter(didRetrieveMovies: movies)
    }
    
    public func interactor(didFailRetrieveMovies error: Error) {
        viewController?.presenter(didFailRetrieveMovies: error.localizedDescription)
    }
    
    public func interactor(didObtainMovie movie: MovieModel) {
        viewController?.presenter(didObtainMovie: movie)
    }

    public func interactor(didFailObtainMovie error: Error) {
        viewController?.presenter(didFailRetrieveMovies: error.localizedDescription)
    }

    public weak var viewController: MoviePresenterOutput?
    
   
}

public protocol MoviePresenterOutput: class {
    func presenter(didRetrieveMovies movies: SearchModel)
    func presenter(didFailRetrieveMovies message: String)
    
    func presenter(didObtainMovie movie: MovieModel)
    func presenter(didFailObtainMovie message: String)
}
