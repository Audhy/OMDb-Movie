//
//  MovieMockServices.swift
//  MovieCoreTests
//
//  Created by Audhy Virabri Kressa on 29/11/22.
//

import XCTest
@testable
import MovieCore
import Alamofire

class MovieMockServices: MovieService {
    
    enum ExpectingResult {
        case success
        case error
    }
    
    var expectingResult: ExpectingResult = .success
    
    func fetch(imdbID: String, onSuccess: @escaping (MovieCore.MovieModel) -> Void, onError: @escaping (Int) -> Void) {
                switch expectingResult {
                    case .success:
                    let mockResult = MovieModel(title: "Avatar: The Last Airbender", year: "2005–2008", rated: "TV-Y7-FV", released: "21 Feb 2005", runtime: "23 min", genre: "Animation, Action, Adventure", director: "N/A", writer: "Michael Dante DiMartino, Bryan Konietzko", actors: "Dee Bradley Baker, Zach Tyler Eisen, Mae Whitman", plot: "In a war-torn world of elemental magic, a young boy reawakens to undertake a dangerous mystic quest to fulfill his destiny as the Avatar, and bring peace to the world.", language: "English", country: "United States", awards: "Won 1 Primetime Emmy. 9 wins & 6 nominations total", poster: "https://m.media-amazon.com/images/M/MV5BODc5YTBhMTItMjhkNi00ZTIxLWI0YjAtNTZmOTY0YjRlZGQ0XkEyXkFqcGdeQXVyODUwNjEzMzg@._V1_SX300.jpg", ratings: [Rating(Source: "Internet Movie Database", Value: "9.3/10")], metascore: "N/A", imdbRating: "9.3", imdbVotes: "312,056", imdbID: "tt0417299", type: "series", dvd: nil, boxOffice: nil, production: nil, website: nil, totalSeasons: "2", response: "True")
                    
                        onSuccess(mockResult)
        
                    case .error:
                        onError(0)
                }
        
                return
    }

}
