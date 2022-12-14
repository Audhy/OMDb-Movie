//
//  SearchPresenterImplementation.swift
//  Movie
//
//  Created by Audhy Virabri Kressa on 28/11/22.
//

import Foundation
import MovieCore

public protocol SearchPresenter: class {
     func interactor(movieTitle: String, movieYear: String?, movieType: String?, didSearch: SearchModel)
     func interactor(didFailSearch error: Error)
}

public class SearchPresenterImplementation: SearchPresenter {
    public init() {}
    public weak var viewController: SearchPresenterOutput?
    
    public func interactor(movieTitle: String, movieYear: String?, movieType: String?,  didSearch movies: SearchModel) {
        viewController?.presenter(movieTitle: movieTitle, movieYear: movieYear, movieType: movieType, didSearch: movies)
    }
    
    public func interactor(didFailSearch error: Error) {
        viewController?.presenter(didFailSearch: error.localizedDescription)
    }
}


public protocol SearchPresenterOutput: class {
    func presenter(movieTitle: String, movieYear: String?, movieType: String?, didSearch movies: SearchModel)
    func presenter(didFailSearch message: String)
}
