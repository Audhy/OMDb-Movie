//
//  MovieCoreTests.swift
//  MovieCoreTests
//
//  Created by Audhy Virabri Kressa on 28/11/22.
//

import XCTest
@testable import MovieCore
@testable import Movie

final class MovieCoreTests: XCTestCase {

    var movieInteractor: MovieInteractorImplementation!
    
    override func setUp() {
        movieInteractor = MovieInteractorImplementation(movieService: MovieMockServices(), searchService: SearchMockServices())
    }
    
    override func tearDown() {
        movieInteractor = nil
    }
    
    func testMoviesServiceSuccess() {
        let mockMoviesService = MovieMockServices()
        mockMoviesService.expectingResult = .success

        movieInteractor = MovieInteractorImplementation(movieService: MovieMockServices(), searchService: SearchMockServices())
        let mockData =  MovieModel(title: "Avatar: The Last Airbender", year: "2005–2008", rated: "TV-Y7-FV", released: "21 Feb 2005", runtime: "23 min", genre: "Animation, Action, Adventure", director: "N/A", writer: "Michael Dante DiMartino, Bryan Konietzko", actors: "Dee Bradley Baker, Zach Tyler Eisen, Mae Whitman", plot: "In a war-torn world of elemental magic, a young boy reawakens to undertake a dangerous mystic quest to fulfill his destiny as the Avatar, and bring peace to the world.", language: "English", country: "United States", awards: "Won 1 Primetime Emmy. 9 wins & 6 nominations total", poster: "https://m.media-amazon.com/images/M/MV5BODc5YTBhMTItMjhkNi00ZTIxLWI0YjAtNTZmOTY0YjRlZGQ0XkEyXkFqcGdeQXVyODUwNjEzMzg@._V1_SX300.jpg", ratings: [Rating(Source: "Internet Movie Database", Value: "9.3/10")], metascore: "N/A", imdbRating: "9.3", imdbVotes: "312,056", imdbID: "tt0417299", type: "series", dvd: nil, boxOffice: nil, production: nil, website: nil, totalSeasons: "2", response: "True")
        movieInteractor.didSelectRow(imdbID: "tt0417299")
        XCTAssertEqual(movieInteractor.movie?.awards, mockData.awards)
        XCTAssertEqual(movieInteractor.movie?.title, mockData.title)
    }

    func testSeatchServiceSuccess() {
        let mockSearchService = SearchMockServices()
        mockSearchService.expectingResult = .success

        let searchInteractor = SearchInteractorImplementation(searchService: SearchMockServices())
        let mockData =  SearchModel(Search: [Search(title: "Avatar: The Last Airbender - The Burning Earth", year: "2007", imdbID: "tt1459461", type: "game", poster: "https://m.media-amazon.com/images/M/MV5BM2M5N2FkY2EtMTJmMy00NjdmLWEwYmEtYjljOWI0MjQ1M2MyXkEyXkFqcGdeQXVyMzM4MjM0Nzg@._V1_SX300.jpg"), Search(title: "The Last Avatar", year: "2014", imdbID: "tt4727514", type: "movie", poster: "https://m.media-amazon.com/images/M/MV5BMjAyMDIyNzA4NV5BMl5BanBnXkFtZTgwMDgxNzE0ODE@._V1_SX300.jpg")],  totalResults: "98", Response: "True")
        searchInteractor.search(title: "avatar", year: nil, type: nil)
        XCTAssertEqual(searchInteractor.searchData?.totalResults, mockData.totalResults)
        XCTAssertEqual(searchInteractor.searchData?.Response, mockData.Response)
    }


    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
