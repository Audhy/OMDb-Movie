//
//  ImageLoader.swift
//  Movie
//
//  Created by Audhy Virabri Kressa on 28/11/22.
//

import Foundation
import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

class ImageLoader: UIImageView {

    var imageURL: URL?

    let activityIndicator = UIActivityIndicatorView()

    func loadImageWithUrl(_ url: URL) {

        // setup activityIndicator...
        activityIndicator.color = .darkGray

        addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

        imageURL = url

        image = nil
        
        activityIndicator.startAnimating()

        // retrieves image if already available in cache
        if let imageFromCache = imageCache.object(forKey: url as AnyObject) as? UIImage {

            self.image = imageFromCache
            activityIndicator.stopAnimating()
            return
        }

        // image does not available in cache.. so retrieving it from url...
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in

            if error != nil {
                print(error as Any)
                self.activityIndicator.stopAnimating()
                return
            }

            DispatchQueue.main.async(execute: {

                if let unwrappedData = data, let imageToCache = UIImage(data: unwrappedData) {

                    if self.imageURL == url {
                        self.image = imageToCache
                    }

                    imageCache.setObject(imageToCache, forKey: url as AnyObject)
                }
                self.activityIndicator.stopAnimating()
            })
        }).resume()
    }
    
    func loadImageWithAsset(_ name: String) {

        // setup activityIndicator...
//        activityIndicator.color = .darkGray
//
//        addSubview(activityIndicator)
//        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
//        activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
//        activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

        

      
        
        

        guard let imageToCache = UIImage(named: "placeholder") else {return}
        self.image = imageToCache
        imageCache.setObject(imageToCache, forKey: name as AnyObject)
    }

}
