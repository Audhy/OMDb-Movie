//
//  MovieService.swift
//  MovieCore
//
//  Created by Audhy Virabri Kressa on 28/11/22.
//

import Foundation
import Alamofire

public protocol MovieService: class {
    func fetch(imdbID: String, onSuccess: @escaping(MovieModel) -> Void, onError: @escaping (Int) -> Void)
}

public class MovieServiceImplementation:MovieService {
    
    public init() {}
    
    public func fetch(imdbID: String, onSuccess: @escaping(MovieModel) -> Void, onError: @escaping (Int) -> Void) {
        print("xxx \(constructEndPoint(imdbID: imdbID))")
        Alamofire.request(constructEndPoint(imdbID: imdbID), method: .post, encoding: JSONEncoding.default).validate(statusCode: 200..<300).responseJSON{ response in
            switch response.result{
                case .success:

                if let movieData = try? JSONDecoder().decode(MovieModel.self,from: response.data!) {
                    onSuccess(movieData)
                } else {
                    onError(0)
                }
                            
                case .failure:
                onError(0)
            }
        }
        
    }
    
    private func constructEndPoint(imdbID: String) -> String {
        
        let finalUrl = MovieAPI.mainUrl + "?apikey=\(MovieConstant.apiKey)" +  ServicesEndPoint.getMovie.rawValue + imdbID
        return finalUrl
    }
  
}
