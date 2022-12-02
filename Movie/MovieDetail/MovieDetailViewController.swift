//
//  MovieDetailViewController.swift
//  Movie
//
//  Created by Audhy Virabri Kressa on 28/11/22.
//

import Foundation
import MovieCore
import UIKit



class MovieDetailViewController: UIViewController, UIScrollViewDelegate {
    
    // MARK: - Lifecycle Methods
    override func loadView() {
        super.loadView()
        self.view = movieDetailView
        
//        interactor?.viewDidLoad()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        movieDetailView?.closeButton.addTarget(self, action: #selector(pressed), for: .touchUpInside)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapImageView(_:)))

        self.movieDetailView?.showCaseImageView.addGestureRecognizer(tapGestureRecognizer)
        self.movieDetailView?.showCaseImageView.isUserInteractionEnabled = true
        
        let tapDismiss = UITapGestureRecognizer(target: self, action: #selector(didTapDismissView(_:)))

        self.movieDetailView?.previewImageView.addGestureRecognizer(tapDismiss)
        self.movieDetailView?.previewImageView.isUserInteractionEnabled = true
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let movieData = movie else {return}
        movieDetailView?.updateLabel(with: movieData)
    }
    
    override func viewDidLayoutSubviews()
    {
        movieDetailView?.scrollView.delegate = self
        movieDetailView?.scrollView.contentSize = CGSize(width:self.view.frame.size.width, height: 500)

    }
    
    @objc func pressed() {
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @objc private func didTapImageView(_ sender: UITapGestureRecognizer) {
        movieDetailView?.previewImageView.alpha = 1
    }

    @objc private func didTapDismissView(_ sender: UITapGestureRecognizer) {
        movieDetailView?.previewImageView.alpha = 0
    }
    
    // MARK: - Properties
    var movieDetailView: MovieDetailView?
    var interactor: MovieInteractor?
    var router: MovieDetailRouter?
    
    var movie:MovieModel?
    
}

// MARK: - Presenter Output
extension MovieDetailViewController: MovieDetailPresenterOutput {
    func presenter(didFailRetrieveMovie message: String) {
        //
    }
    
    func presenter(didRetrieveMovie movie: MovieModel) {
        self.movie = movie
        movieDetailView?.updateLabel(with: movie)
    }
}

extension MovieDetailViewController {
    
    
}
