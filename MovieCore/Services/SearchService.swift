//
//  SearchService.swift
//  MovieCore
//
//  Created by Audhy Virabri Kressa on 28/11/22.
//

import Foundation
import Alamofire

public protocol SearchService: class {
    func fetch(page: Int, title: String, year: String?, type: String?, onSuccess: @escaping(SearchModel) -> Void, onError: @escaping (Int) -> Void)
}

public class SearchServiceImplementation:SearchService {
    
    public init() {}
    
    public func fetch(page: Int, title: String, year: String?, type: String?, onSuccess: @escaping(SearchModel) -> Void, onError: @escaping (Int) -> Void) {
        
        Alamofire.request(constructEndPoint(title: title, year: year, type: type, page: page), method: .post, encoding: JSONEncoding.default).validate(statusCode: 200..<300).responseJSON{ response in
            switch response.result{
                case .success:

                if let movieData = try? JSONDecoder().decode(SearchModel.self,from: response.data!) {
                    onSuccess(movieData)
                } else {
                    onError(0)
                }
                            
                case .failure:
                onError(0)
            }
        }
        
    }
    
    private func constructEndPoint(title: String, year: String?, type: String?, page: Int) -> String {
        
        var finalUrl = MovieAPI.mainUrl + "?apikey=\(MovieConstant.apiKey)" +  ServicesEndPoint.searchTitle.rawValue + title + "&page=\(page)"
        
        if year != nil {
            finalUrl = finalUrl + ServicesEndPoint.getYear.rawValue + (year ?? "")
        }
        
        if type != nil {
            finalUrl = finalUrl + ServicesEndPoint.getType.rawValue + (type ?? "")
        }
        
        return finalUrl
    }
  
}
