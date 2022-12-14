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
    public var title: String?
    public var year: String?
    public var imdbID: String?
    public var type: String?
    public var poster: String?
    
    init(title: String? = nil, year: String? = nil, imdbID: String? = nil, type: String? = nil, poster: String? = nil) {
        self.title = title
        self.year = year
        self.imdbID = imdbID
        self.type = type
        self.poster = poster
    }
    
    enum CodingKeys: String, CodingKey {
           case title = "Title"
           case year = "Year"
           case imdbID
           case type = "Type"
           case poster = "Poster"
       }
}
