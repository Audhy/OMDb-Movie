//
//  MovieInteractor.swift
//  MovieCore
//
//  Created by Audhy Virabri Kressa on 28/11/22.
//

import Foundation
import MovieCore

public protocol MovieInteractor: class {
    func didSelectRow(imdbID: String)
    func viewDidLoad(movieTitle: String, movieYear: String, movieType: String)
}

public class MovieInteractorImplementation: MovieInteractor {
    var movie: MovieModel?
    var page: Int
    private let movieService:MovieService
    var presenter: MoviePresenter?
    let searchService:SearchService
    
    public init(movieService:MovieService, searchService:SearchService){
        self.movieService = movieService
        self.searchService = searchService
        self.page = 1
    }
    
    public func viewDidLoad(movieTitle: String, movieYear: String, movieType: String)  {
        page += 1
        searchService.fetch(page: page, title: movieTitle, year: movieYear, type: movieType) { (respone) in
            self.presenter?.interactor(didRetrieveMovies: respone)
        } onError: { Error in
            self.presenter?.interactor(didFailRetrieveMovies: FetchError.failed)
        }

    }
    
    public func didSelectRow(imdbID: String) {
        movieService.fetch(imdbID: imdbID) { (respone) in
            self.movie = respone
            self.presenter?.interactor(didObtainMovie: respone)
        } onError: { Error in
            self.presenter?.interactor(didFailObtainMovie: FetchError.failed)
        }

    }
}
