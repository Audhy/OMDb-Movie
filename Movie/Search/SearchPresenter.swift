//
//  SearchPresenterImplementation.swift
//  Movie
//
//  Created by Audhy Virabri Kressa on 28/11/22.
//

import Foundation
import MovieCore

protocol SearchPresenter: class {
    func interactor(movieTitle: String, movieYear: String?, movieType: String?, didSearch: SearchModel)
    func interactor(didFailSearch error: Error)
}

class SearchPresenterImplementation: SearchPresenter {
    weak var viewController: SearchPresenterOutput?
    
    func interactor(movieTitle: String, movieYear: String?, movieType: String?,  didSearch movies: SearchModel) {
        viewController?.presenter(movieTitle: movieTitle, movieYear: movieYear, movieType: movieType, didSearch: movies)
    }
    
    func interactor(didFailSearch error: Error) {
        viewController?.presenter(didFailSearch: error.localizedDescription)
    }
}
