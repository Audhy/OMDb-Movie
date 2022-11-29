//
//  MovieDetailPresenter.swift
//  Movie
//
//  Created by Audhy Virabri Kressa on 28/11/22.
//

import Foundation
import MovieCore

protocol MovieDetailPresenter: class {
    func interactor(didRetrieveMovie movie: MovieModel)
    func interactor(didFailRetrieveMovie error: Error)
}

class MovieDetailPresenterImplementation: MovieDetailPresenter {
    func interactor(didFailRetrieveMovie error: Error) {
        viewController?.presenter(didFailRetrieveMovie: error.localizedDescription)
    }
    
    func interactor(didRetrieveMovie movie: MovieModel) {
        viewController?.presenter(didRetrieveMovie: movie)
    }
    
    
    
    weak var viewController: MovieDetailPresenterOutput?
    
   
}
