//
//  SearchMockServices.swift
//  MovieCoreTests
//
//  Created by Audhy Virabri Kressa on 29/11/22.
//

import XCTest
@testable
import MovieCore
import Alamofire

class SearchMockServices: SearchService {    
    
    enum ExpectingResult {
        case success
        case error
    }
    
    var expectingResult: ExpectingResult = .success
    
    func fetch(page: Int, title: String, year: String?, type: String?, onSuccess: @escaping (MovieCore.SearchModel) -> Void, onError: @escaping (Int) -> Void) {
                switch expectingResult {
                    case .success:
                    let mockResult = SearchModel(Search: [Search(title: "Avatar: The Last Airbender - The Burning Earth", year: "2007", imdbID: "tt1459461", type: "game", poster: "https://m.media-amazon.com/images/M/MV5BM2M5N2FkY2EtMTJmMy00NjdmLWEwYmEtYjljOWI0MjQ1M2MyXkEyXkFqcGdeQXVyMzM4MjM0Nzg@._V1_SX300.jpg"), Search(title: "The Last Avatar", year: "2014", imdbID: "tt4727514", type: "movie", poster: "https://m.media-amazon.com/images/M/MV5BMjAyMDIyNzA4NV5BMl5BanBnXkFtZTgwMDgxNzE0ODE@._V1_SX300.jpg")],  totalResults: "98", Response: "True")
                    
                        onSuccess(mockResult)
        
                    case .error:
                        onError(0)
                }
        
                return
    }

}
