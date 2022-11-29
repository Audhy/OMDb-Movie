//
//  SearchInteractor.swift
//  MovieCore
//
//  Created by Audhy Virabri Kressa on 28/11/22.
//

import Foundation
import MovieCore

public protocol SearchInteractor: class {
    func search(title: String, year: String?, type: String?)
}

public class SearchInteractorImplementation: SearchInteractor {
    var presenter: SearchPresenter?
    private let searchService:SearchService
    var searchData: SearchModel?
    public init(searchService:SearchService){
        self.searchService = searchService
    }
    
    public func search(title: String, year: String?, type: String?) {
        searchService.fetch(page: 1, title: title, year: year, type: type, onSuccess: { (respone) in
            self.searchData = respone
            self.presenter?.interactor(movieTitle: title, movieYear: year, movieType: type, didSearch: respone)
        }, onError: { Error in
            self.presenter?.interactor(didFailSearch: FetchError.failed)
        })

    }    
}
