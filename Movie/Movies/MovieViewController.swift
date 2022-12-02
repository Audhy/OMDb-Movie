//
//  MovieViewController.swift
//  Movie
//
//  Created by Audhy Virabri Kressa on 28/11/22.
//

import Foundation
import UIKit
import MovieCore



class MovieViewController: UIViewController {
    
    
    // MARK: - Lifecycle Methods
    override func loadView() {
        super.loadView()
        
        self.view = movieView
        movieView?.collectionView.dataSource = self
        movieView?.collectionView.delegate = self
        movieView?.collectionView.register(MovieCell.self, forCellWithReuseIdentifier: "Cell")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.parent?.title = "Movies"
        self.title = "Movies"
        
    }
    
    
    // MARK: - Properties
    var movieView: MovieView?
    var movieTitle: String?
    var movieYear: String?
    var movieType: String?
    var interactor: MovieInteractor?
    var router: MovieRouter?
    
    var movies: SearchModel?
    
}

// MARK: - Presenter Output
extension MovieViewController: MoviePresenterOutput {
    
    
    func presenter(didRetrieveMovies movies: SearchModel) {
        self.movies?.Search.append(contentsOf: movies.Search)
        self.movieView?.activityView.stopAnimating()
        movieView?.collectionView.reloadData()
        //        wishlistView?.tableView.reloadData()
        
    }
    
    func presenter(didFailRetrieveMovies message: String) {
        let alertView = UIAlertView()
        alertView.addButton(withTitle: "Ok")
        alertView.title = "Erro Fetch Movies"
        alertView.message = "Error: \(message)"
        alertView.show()
    }
    
    func presenter(didObtainMovie movie: MovieModel) {
        let vc = MovieDetailViewController()
        MovieDetailConfiguration.configureModule(movie: movie, viewController: vc)
        self.present(vc, animated: true, completion: nil)
    }
    
    func presenter(didFailObtainMovie message: String) {
        let alertView = UIAlertView()
        alertView.addButton(withTitle: "Ok")
        alertView.title = "Error Fetch Movies"
        alertView.message = "Error: \(message)"
        alertView.show()
    }
}


extension MovieViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        return movies?.Search.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var data:[Search] = movies?.Search ?? []
        
//        if filteredPokemons.count > 0 {
//            data = filteredPokemons
//        } else {
//            data = pokemons
//        }
        
        let totalResult = Int(movies?.totalResults ?? "0") ?? 0
        if collectionView.isLast(for: indexPath) && (movies?.Search.count ?? 0) < totalResult{
            if data.count > 6 {
                self.movieView?.activityView.startAnimating()
            }
            interactor?.viewDidLoad(movieTitle: movieTitle ?? "", movieYear: movieYear ?? "", movieType: movieType ?? "")
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MovieCell
        cell.titleLabel.text = data[indexPath.row].title
        if data[indexPath.row].poster != "N/A" {
            let url = URL(string: data[indexPath.row].poster)
            
            let ImagePath = data[indexPath.item].poster
            if  let strUrl = ImagePath.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed),
                let imgUrl = URL(string: strUrl) {
                
                cell.movieImageView.loadImageWithUrl(imgUrl)
            }
        } else {
            let url = URL(string: "https://media.istockphoto.com/id/922962354/vector/no-image-available-sign.jpg?b=1&s=170667a&w=0&k=20&c=VqpxaeBt-p0q2JlujQV-0fmCsaD3NeP4mmOUX4uZEIc=")
            
            let ImagePath = data[indexPath.item].poster
            
            cell.movieImageView.loadImageWithAsset(ImagePath)
            
        }
       
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.interactor?.didSelectRow(imdbID: movies?.Search[indexPath.row].imdbID ?? "")
    }
}
extension MovieViewController: UICollectionViewDelegate {
    //
}

extension UICollectionView {
    
    func isLast(for indexPath: IndexPath) -> Bool {
        
        let indexOfLastSection = numberOfSections > 0 ? numberOfSections - 1 : 0
        let indexOfLastRowInLastSection = numberOfItems(inSection: indexOfLastSection) - 1
        
        return indexPath.section == indexOfLastSection && indexPath.row == indexOfLastRowInLastSection
    }
    
}
