//
//  SearchviewController.swift
//  Movie
//
//  Created by Audhy Virabri Kressa on 28/11/22.
//

import Foundation
import MovieCore
import UIKit
import Reachability

protocol SearchPresenterOutput: class {
    func presenter(movieTitle: String, movieYear: String?, movieType: String?, didSearch movies: SearchModel)
    func presenter(didFailSearch message: String)
}

class SearchViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let reachability = try! Reachability()
    
    // MARK: - Properties
    var searchView: SearchView?
    var interactor: SearchInteractor?
    var router: SearchRouter?
    let dataArray = ["movie", "series", "episode"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view = searchView
        
        searchView?.searchButton.addTarget(self, action: #selector(pressed), for: .touchUpInside)
        
        searchView?.advanceButton.addTarget(self, action: #selector(advancePressed), for: .touchUpInside)
        
        searchView?.UIPicker.delegate = self as UIPickerViewDelegate
        searchView?.UIPicker.dataSource = self as UIPickerViewDataSource
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(reachabilityChanged(note:)), name: .reachabilityChanged, object: reachability)
        do{
            try reachability.startNotifier()
        }catch{
            print("could not start reachability notifier")
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @objc func reachabilityChanged(note: Notification) {
        
        let reachability = note.object as! Reachability
        
        switch reachability.connection {
        case .wifi:
            self.searchView?.hideStatus()
        case .cellular:
            self.searchView?.hideStatus()
        case .unavailable:
            self.searchView?.showStatus(text: "Please check your connection")
        case .none:
            self.searchView?.showStatus(text: "Your network not avaliable, please check and try again")
        }
    }
    
    @objc func pressed() {
        searchView?.hideStatus()
        guard let title = searchView?.searchTextField.text else {return}
        guard let year = searchView?.yearTextField.text else {return}
        guard let type = searchView?.typeTextField.text else {return}

        if title != "" {
            interactor?.search(title: title, year: year, type: type)
        } else {
            let alertView = UIAlertView()
            alertView.addButton(withTitle: "Ok")
            alertView.title = "Failed"
            alertView.message = "Please Try Again Later"
            alertView.show()
        }
        
    }
    
    @objc func advancePressed() {
        searchView?.showAdvance()
        
        
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let row = dataArray[row]
        
        searchView?.typeTextField.text = row
        return row
    }
    
}


// MARK: - Presenter Output
extension SearchViewController: SearchPresenterOutput {
    func presenter(movieTitle: String, movieYear: String?, movieType: String?, didSearch movies: SearchModel) {
        self.router?.routeToMovies(movieTitle: movieTitle, movieYear: movieYear, movieType: movieType, movies: movies)
    }
    
    func presenter(didFailSearch message: String) {
        searchView?.showStatus(text: "Error \(message)")
    }
    
}

