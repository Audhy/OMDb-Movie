//
//  MovieConstant.swift
//  MovieCore
//
//  Created by Audhy Virabri Kressa on 28/11/22.
//

import Foundation

enum MovieAPI {
    static let devMainUrl = "https://www.omdbapi.com"
    static let prodMainUrl = ""
    
    static var mainUrl: String {
        return MovieAPI.devMainUrl
    }
}

enum ServicesEndPoint: String {
    case searchTitle = "&s="
    case getMovie = "&i="
    case getYear = "&y="
    case getType = "&type="
}

enum MovieConstant {
    static let uniqueAccessGroup = "group.my.id.audhy.movie"
    static let apiKey = "eac75611"
}

public enum FetchError: Error {
    case failed
}
