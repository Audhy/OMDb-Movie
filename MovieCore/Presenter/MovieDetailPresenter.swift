//
//  MovieDetailPresenter.swift
//  Movie
//
//  Created by Audhy Virabri Kressa on 28/11/22.
//

import Foundation
import MovieCore

public protocol MovieDetailPresenter: class {
     func interactor(didRetrieveMovie movie: MovieModel)
     func interactor(didFailRetrieveMovie error: Error)
}

public class MovieDetailPresenterImplementation: MovieDetailPresenter {
    public init() {}
    public func interactor(didFailRetrieveMovie error: Error) {
        viewController?.presenter(didFailRetrieveMovie: error.localizedDescription)
    }
    
    public func interactor(didRetrieveMovie movie: MovieModel) {
        viewController?.presenter(didRetrieveMovie: movie)
    }
    
    
    
    public weak var viewController: MovieDetailPresenterOutput?
    
   
}

public protocol MovieDetailPresenterOutput: class {
    func presenter(didRetrieveMovie movies: MovieModel)
    func presenter(didFailRetrieveMovie message: String)
}
