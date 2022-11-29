//
//  MovieDetailView.swift
//  Movie
//
//  Created by Audhy Virabri Kressa on 28/11/22.
//

import Foundation
import MovieCore
import UIKit

class MovieDetailView: UIView {
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    // MARK: - Actions
    public func updateLabel(with movie: MovieModel) {
        titleLabel.text = movie.title
        yearLabel.text = " (\(movie.year))"
        genreLabel.text = movie.genre
        totalSeasonsLabel.text = movie.totalSeasons ?? "1 Season"
        plotLabel.text = movie.plot
        imdbRatingLabel.text = "iMDb \(movie.imdbRating) - \(movie.imdbRating) votes"
        
        directorLabel.text = "Director : \(movie.director)"

        writerLabel.text =  "Writer : \(movie.writer)"

        actorLabel.text =  "Actors : \(movie.actors)"

        awardLabel.text = movie.awards
        
        if movie.poster != "N/A" {
            let url = URL(string: movie.poster)
            let dataImage = try? Data(contentsOf: url!)
            showCaseImageView.image = UIImage(data: dataImage!)
            previewImageView.image = UIImage(data: dataImage!)
        } else {
            guard let imageToCache = UIImage(named: "placeholder") else {return}
            showCaseImageView.image = imageToCache
            previewImageView.image = imageToCache
        }
        
        //
        //        genreAndDurationLabel.text = "\(movie.genre) - \(movie.duration)"
        //
        //        descriptionLabel.text = movie.desc
        //        actorNameLabel.text = actor(names: movie.starring)
        
    }
    
    lazy var scrollView: UIScrollView = {
        let object = UIScrollView()
        
        object.backgroundColor = UIColor.white
        object.translatesAutoresizingMaskIntoConstraints = false
        object.contentSize = CGSize(width:UIScreen.main.bounds.width, height: 1000)
        return object
    }()
    lazy var contentView = UIView()
    

    

    
    
    // MARK: - Properties
    
    lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setTitle("X", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var navBarLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.text = "Detail Movie"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var previewImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.white
        imageView.image = UIImage(named: "placeholder")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.alpha = 0
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var showCaseImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.white
        imageView.image = UIImage(named: "placeholder")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: (UIDevice().type == .iPhone4 || UIDevice().type == .iPhone5 || UIDevice().type == .iPhone5S || UIDevice().type == .iPhone5C || UIDevice().type == .iPhoneSE) ? 15.0 : 20.0)
        label.textColor = .black
        label.tintColor = .black
        label.text = ""
        label.numberOfLines = -1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var yearLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: (UIDevice().type == .iPhone4 || UIDevice().type == .iPhone5 || UIDevice().type == .iPhone5S || UIDevice().type == .iPhone5C || UIDevice().type == .iPhoneSE) ? 15.0 : 20.0)
        label.textColor = .black
        label.tintColor = .black
        label.text = ""
        label.numberOfLines = -1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    lazy var ratedLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: (UIDevice().type == .iPhone4 || UIDevice().type == .iPhone5 || UIDevice().type == .iPhone5S || UIDevice().type == .iPhone5C || UIDevice().type == .iPhoneSE) ? 15.0 : 20.0)
        label.textColor = .black
        label.tintColor = .black
        label.text = ""
        label.numberOfLines = -1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    lazy var releasedLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: (UIDevice().type == .iPhone4 || UIDevice().type == .iPhone5 || UIDevice().type == .iPhone5S || UIDevice().type == .iPhone5C || UIDevice().type == .iPhoneSE) ? 15.0 : 20.0)
        label.textColor = .black
        label.tintColor = .black
        label.text = ""
        label.numberOfLines = -1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    lazy var runtimeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: (UIDevice().type == .iPhone4 || UIDevice().type == .iPhone5 || UIDevice().type == .iPhone5S || UIDevice().type == .iPhone5C || UIDevice().type == .iPhoneSE) ? 15.0 : 20.0)
        label.textColor = .black
        label.tintColor = .black
        label.text = ""
        label.numberOfLines = -1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    lazy var genreLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: (UIDevice().type == .iPhone4 || UIDevice().type == .iPhone5 || UIDevice().type == .iPhone5S || UIDevice().type == .iPhone5C || UIDevice().type == .iPhoneSE) ? 10.0 : 15.0)
        label.textColor = .black
        label.tintColor = .black
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    lazy var directorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: (UIDevice().type == .iPhone4 || UIDevice().type == .iPhone5 || UIDevice().type == .iPhone5S || UIDevice().type == .iPhone5C || UIDevice().type == .iPhoneSE) ? 8.0 : 13.0)
        label.textColor = .black
        label.tintColor = .black
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    lazy var writerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: (UIDevice().type == .iPhone4 || UIDevice().type == .iPhone5 || UIDevice().type == .iPhone5S || UIDevice().type == .iPhone5C || UIDevice().type == .iPhoneSE) ? 8.0 : 13.0)
        label.textColor = .black
        label.tintColor = .black
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    lazy var languageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: (UIDevice().type == .iPhone4 || UIDevice().type == .iPhone5 || UIDevice().type == .iPhone5S || UIDevice().type == .iPhone5C || UIDevice().type == .iPhoneSE) ? 15.0 : 20.0)
        label.textColor = .black
        label.tintColor = .black
        label.text = ""
        label.numberOfLines = -1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    lazy var countryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: (UIDevice().type == .iPhone4 || UIDevice().type == .iPhone5 || UIDevice().type == .iPhone5S || UIDevice().type == .iPhone5C || UIDevice().type == .iPhoneSE) ? 15.0 : 20.0)
        label.textColor = .black
        label.tintColor = .black
        label.text = ""
        label.numberOfLines = -1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    lazy var awardsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: (UIDevice().type == .iPhone4 || UIDevice().type == .iPhone5 || UIDevice().type == .iPhone5S || UIDevice().type == .iPhone5C || UIDevice().type == .iPhoneSE) ? 15.0 : 20.0)
        label.textColor = .black
        label.tintColor = .black
        label.text = ""
        label.numberOfLines = -1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    lazy var metaScoreLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: (UIDevice().type == .iPhone4 || UIDevice().type == .iPhone5 || UIDevice().type == .iPhone5S || UIDevice().type == .iPhone5C || UIDevice().type == .iPhoneSE) ? 15.0 : 20.0)
        label.textColor = .black
        label.tintColor = .black
        label.text = ""
        label.numberOfLines = -1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    lazy var imdbRatingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: (UIDevice().type == .iPhone4 || UIDevice().type == .iPhone5 || UIDevice().type == .iPhone5S || UIDevice().type == .iPhone5C || UIDevice().type == .iPhoneSE) ? 10.0 : 15.0)
        label.textColor = .black
        label.tintColor = .black
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        
    lazy var imdbIDLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: (UIDevice().type == .iPhone4 || UIDevice().type == .iPhone5 || UIDevice().type == .iPhone5S || UIDevice().type == .iPhone5C || UIDevice().type == .iPhoneSE) ? 15.0 : 20.0)
        label.textColor = .black
        label.tintColor = .black
        label.text = ""
        label.numberOfLines = -1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    lazy var typeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: (UIDevice().type == .iPhone4 || UIDevice().type == .iPhone5 || UIDevice().type == .iPhone5S || UIDevice().type == .iPhone5C || UIDevice().type == .iPhoneSE) ? 15.0 : 20.0)
        label.textColor = .black
        label.tintColor = .black
        label.text = ""
        label.numberOfLines = -1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var totalSeasonsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: (UIDevice().type == .iPhone4 || UIDevice().type == .iPhone5 || UIDevice().type == .iPhone5S || UIDevice().type == .iPhone5C || UIDevice().type == .iPhoneSE) ? 10.0 : 15.0)
        label.textColor = .black
        label.tintColor = .black
        label.text = ""
        label.numberOfLines = -1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    lazy var plotLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: (UIDevice().type == .iPhone4 || UIDevice().type == .iPhone5 || UIDevice().type == .iPhone5S || UIDevice().type == .iPhone5C || UIDevice().type == .iPhoneSE) ? 10.0 : 16.0)
        label.textColor = .black
        label.tintColor = .black
        label.numberOfLines = 0
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var actorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: (UIDevice().type == .iPhone4 || UIDevice().type == .iPhone5 || UIDevice().type == .iPhone5S || UIDevice().type == .iPhone5C || UIDevice().type == .iPhoneSE) ? 8.0 : 13.0)
        label.textColor = .black
        label.tintColor = .black
        label.text = ""
        label.numberOfLines = -1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var awardTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: (UIDevice().type == .iPhone4 || UIDevice().type == .iPhone5 || UIDevice().type == .iPhone5S || UIDevice().type == .iPhone5C || UIDevice().type == .iPhoneSE) ? 13.0 : 18.0)
        label.textColor = .black
        label.tintColor = .black
        label.text = "AWARDS :"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var awardLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: (UIDevice().type == .iPhone4 || UIDevice().type == .iPhone5 || UIDevice().type == .iPhone5S || UIDevice().type == .iPhone5C || UIDevice().type == .iPhoneSE) ? 12.0 : 17.0)
        label.textColor = .black
        label.tintColor = .black
        label.text = ""
        label.numberOfLines = -1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

// MARK: - UI Setup
extension MovieDetailView {
    private func setupUI() {
        if #available(iOS 13.0, *) {
            self.backgroundColor = UIColor.systemBackground
        } else {
            // Fallback on earlier versions
        }
        
        let mainSreenWidth = UIScreen.main.bounds.size.width
        let mainScreenHeight = UIScreen.main.bounds.size.height
        
        //        self.addSubview(navBarLabel)
        self.addSubview(showCaseImageView)
        self.addSubview(closeButton)
        self.addSubview(scrollView)

        
        scrollView.addSubview(contentView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(yearLabel)
        contentView.addSubview(genreLabel)
        contentView.addSubview(totalSeasonsLabel)
        contentView.addSubview(plotLabel)
        contentView.addSubview(imdbRatingLabel)
        contentView.addSubview(directorLabel)
        contentView.addSubview(writerLabel)
        contentView.addSubview(actorLabel)
        contentView.addSubview(awardTitle)
        contentView.addSubview(awardLabel)

        self.addSubview(previewImageView)
        
        closeButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 15).isActive = true
        closeButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        
        showCaseImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        showCaseImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        showCaseImageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -0).isActive = true
        showCaseImageView.heightAnchor.constraint(equalToConstant: 220).isActive = true
        
        previewImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        previewImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5).isActive = true
        previewImageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -6).isActive = true
        previewImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height-10).isActive = true
        
        scrollView.topAnchor.constraint(equalTo: showCaseImageView.bottomAnchor, constant: 100).isActive = true
        scrollView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        scrollView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.showCaseImageView.bottomAnchor, constant: 0).isActive = true
        scrollView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        scrollView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true

        
        contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 5).isActive = true
        contentView.leftAnchor.constraint(equalTo: self.scrollView.leftAnchor, constant: 5).isActive = true
        contentView.rightAnchor.constraint(equalTo: self.scrollView.rightAnchor, constant: 5).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: 5).isActive = true

        
        
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
        
        yearLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        yearLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 5).isActive = true
        
        genreLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        genreLabel.leadingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 5).isActive = true
        
        totalSeasonsLabel.topAnchor.constraint(equalTo: genreLabel.bottomAnchor, constant: 10).isActive = true
        totalSeasonsLabel.leadingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 5).isActive = true
        
        imdbRatingLabel.topAnchor.constraint(equalTo: totalSeasonsLabel.bottomAnchor, constant: 10).isActive = true
        imdbRatingLabel.leadingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 5).isActive = true
        
        plotLabel.topAnchor.constraint(equalTo: imdbRatingLabel.bottomAnchor, constant: 10).isActive = true
        plotLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
        plotLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: UIScreen.main.bounds.width).isActive = true

        directorLabel.topAnchor.constraint(equalTo: plotLabel.bottomAnchor, constant: 10).isActive = true
        directorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
        
        writerLabel.topAnchor.constraint(equalTo: directorLabel.bottomAnchor, constant: 10).isActive = true
        writerLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
        
        actorLabel.topAnchor.constraint(equalTo: writerLabel.bottomAnchor, constant: 10).isActive = true
        actorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
        actorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: UIScreen.main.bounds.width-20).isActive = true

        awardTitle.topAnchor.constraint(equalTo: actorLabel.bottomAnchor, constant: 10).isActive = true
        awardTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true

        awardLabel.topAnchor.constraint(equalTo: awardTitle.bottomAnchor, constant: 10).isActive = true
        awardLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
        awardLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: UIScreen.main.bounds.width-20).isActive = true
        
        
        setNeedsUpdateConstraints()
    }
}
