//
//  MovieCell.swift
//  Movie
//
//  Created by Audhy Virabri Kressa on 28/11/22.
//

import Foundation
import UIKit

class MovieCell: UICollectionViewCell {
    fileprivate let newContentView = UIView()
    let movieImageView: ImageLoader = {
        
        let img = ImageLoader()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        return img
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.numberOfLines = 0
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    // must call super
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 26/255, green: 32/255, blue: 44/255, alpha: 1)
        configureView()
    }
    
    // we have to implement this initializer, but will only ever use this class programmatically
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(colour: UIColor) {
        self.backgroundColor = colour
    }
    
    
    
    
    func configureView() {
        // add and configure subviews here
        
        addSubview(movieImageView)
        addSubview(titleLabel)
        
        movieImageView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        movieImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 3).isActive = true
        movieImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        movieImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2 - 50).isActive = true

        titleLabel.topAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: 2).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 5).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -5).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -7).isActive = true

    }
}
