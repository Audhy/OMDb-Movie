//
//  SearchConfiguration.swift
//  Movie
//
//  Created by Audhy Virabri Kressa on 28/11/22.
//

import Foundation
import MovieCore

class SearchConfiguration {
    
    static func configureModule(viewController: SearchViewController) {
        let view = SearchView()
        let router = SearchRouterImplementation()
        let interactor = SearchInteractorImplementation(searchService: SearchServiceImplementation())
        let presenter = SearchPresenterImplementation()
        
        viewController.searchView = view
        viewController.router = router
        viewController.interactor = interactor
        
        interactor.presenter = presenter
        
        presenter.viewController = viewController
        
        router.navigationController = viewController.navigationController
    }
}
