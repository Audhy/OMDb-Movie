//
//  MovieView.swift
//  Movie
//
//  Created by Audhy Virabri Kressa on 28/11/22.
//

import Foundation
import UIKit

class MovieView: UIView {
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        let screenSize: CGRect = UIScreen.main.bounds
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: screenSize.width, height: 700)
        
        collectionView = UICollectionView(frame: screenSize, collectionViewLayout: layout)
        
       
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var didSetupConstraints = false
    

    public func reloadCollectionView() {
        self.collectionView.reloadData()
    }
    
    // MARK: - Properties
    lazy var activityView = UIActivityIndicatorView(style: .whiteLarge)
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView()
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    
}

// MARK: - UI Setup
extension MovieView {
    private func setupUI() {
        if #available(iOS 13.0, *) {
            self.backgroundColor = UIColor.systemBackground
        } else {
            // Fallback on earlier versions
        }
        
        if #available(iOS 13.0, *) {
            self.collectionView.backgroundColor = UIColor.systemBackground
        } else {
            // Fallback on earlier versions
        }
        
        self.addSubview(collectionView)

        self.addSubview(activityView)
        
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout{
                layout.minimumLineSpacing = 10
                layout.minimumInteritemSpacing = 10
                layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
            let size = CGSize(width:(collectionView.bounds.width-30)/2, height: 400)
                layout.itemSize = size
        }
        
        activityView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        activityView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

        
        setNeedsUpdateConstraints()
    }
}
