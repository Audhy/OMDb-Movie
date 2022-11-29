//
//  SearchModel.swift
//  MovieCore
//
//  Created by Audhy Virabri Kressa on 28/11/22.
//

import Foundation

public struct SearchModel: Hashable, Codable {
    public var Search: [Search]
    public let totalResults: String
    public let Response: String
}

public struct Search: Hashable, Codable {
    public let title: String
    public let year: String
    public let imdbID: String
    public let type: String
    public let poster: String
    
    enum CodingKeys: String, CodingKey {
           case title = "Title"
           case year = "Year"
           case imdbID
           case type = "Type"
           case poster = "Poster"
       }
}
