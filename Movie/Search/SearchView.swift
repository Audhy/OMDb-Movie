//
//  SearchView.swift
//  Movie
//
//  Created by Audhy Virabri Kressa on 28/11/22.
//

import Foundation
import UIKit

class SearchView: UIView {
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    public func showStatus(text: String) {
        UIView.animate(withDuration: 0.3) {
            self.statusLabel.text = text
            self.statusLabel.alpha = 1.0
        }
    }
    
    public func hideStatus() {
        UIView.animate(withDuration: 0.3) {
            self.statusLabel.alpha = 0.0
        }
    }
    
    // MARK: - Properties
    
    let UIPicker: UIPickerView = UIPickerView()
    
    lazy var omdb: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 130/255, green: 131/255, blue: 134/255, alpha: 1)
        label.font = .systemFont(ofSize: 52, weight: .regular)
        label.text = "OMDb"
        
        return label
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 130/255, green: 131/255, blue: 134/255, alpha: 1)
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.text = "Title Movie"
        
        return label
    }()
    
    lazy var searchTextField:UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "title"
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.font = UIFont.systemFont(ofSize: 13)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.clearButtonMode = UITextField.ViewMode.whileEditing;
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return textField
    }()
    
    lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.numberOfLines = -1
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var searchButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Search", for: .normal)
        button.setTitleColor(UIColor(red: 130/255, green: 131/255, blue: 134/255, alpha: 1), for: .normal)
        button.backgroundColor = UIColor(red: 224/255, green: 226/255, blue: 226/255, alpha: 1)
        button.layer.cornerRadius = 5
        
        return button
    }()
    
    lazy var advanceButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Advanced Filter", for: .normal)
        button.setTitleColor(UIColor(red: 130/255, green: 131/255, blue: 134/255, alpha: 1), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12)
        return button
    }()
    
    lazy var yearLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 130/255, green: 131/255, blue: 134/255, alpha: 1)
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.text = "Year of release"
        label.alpha = 0
        return label
    }()
    
    lazy var yearTextField:UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "year"
        textField.keyboardType = .numberPad
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.font = UIFont.systemFont(ofSize: 13)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.clearButtonMode = UITextField.ViewMode.whileEditing;
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textField.alpha = 0
        return textField
    }()
    
    lazy var toolBar: UIToolbar = {
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(self.doneTapped))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.cancelTapped))
        
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        return toolBar
    }()
    

    func showAdvance() {
        if yearLabel.alpha == 0 {
            yearLabel.alpha = 1
            yearTextField.alpha = 1
            typeLabel.alpha = 1
            typeTextField.alpha = 1
            advanceButton.setTitle("Close Filter Advance", for: .normal)
        } else {
            yearLabel.alpha = 0
            yearTextField.alpha = 0
            typeLabel.alpha = 0
            typeTextField.alpha = 0
            advanceButton.setTitle("Advanced Filter", for: .normal)
        }
       
    }
    
    @objc func doneTapped() {
        self.endEditing(true)
        }
    
    @objc func cancelTapped() {
        self.endEditing(true)
        }
    
    
    lazy var typeTextField:UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "year"
        textField.keyboardType = .numberPad
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.font = UIFont.systemFont(ofSize: 13)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.clearButtonMode = UITextField.ViewMode.whileEditing;
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textField.inputView = UIPicker
        textField.inputAccessoryView = toolBar
        textField.alpha = 0
        return textField
    }()
    
    lazy var typeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 130/255, green: 131/255, blue: 134/255, alpha: 1)
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.text = "Type of movie"
        label.alpha = 0
        return label
    }()
    
}

// MARK: - UI Setup
extension SearchView {
    private func setupUI() {
        if #available(iOS 13.0, *) {
            self.backgroundColor = UIColor.systemBackground
        } else {
            // Fallback on earlier versions
        }
        
        
        self.addSubview(omdb)
        self.addSubview(titleLabel)
        self.addSubview(searchTextField)
        self.addSubview(statusLabel)
        self.addSubview(advanceButton)
        self.addSubview(searchButton)
        self.addSubview(yearLabel)
        self.addSubview(yearTextField)
        self.addSubview(typeLabel)
        self.addSubview(typeTextField)
        
        omdb.topAnchor.constraint(equalTo: self.topAnchor, constant: 130).isActive = true
        omdb.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: omdb.bottomAnchor, constant: 46).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        
        searchTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
        searchTextField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        searchTextField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        searchTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        advanceButton.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 20).isActive = true
        advanceButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        advanceButton.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        yearLabel.topAnchor.constraint(equalTo: advanceButton.bottomAnchor, constant: 46).isActive = true
        yearLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        
        yearTextField.topAnchor.constraint(equalTo: yearLabel.bottomAnchor, constant: 5).isActive = true
        yearTextField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        yearTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        yearTextField.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2-20).isActive = true
        
        typeLabel.topAnchor.constraint(equalTo: advanceButton.bottomAnchor, constant: 46).isActive = true
        typeLabel.leftAnchor.constraint(equalTo: yearTextField.rightAnchor, constant: 20).isActive = true
        
        
        typeTextField.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 5).isActive = true
        typeTextField.leftAnchor.constraint(equalTo: yearTextField.rightAnchor, constant: 20).isActive = true
        typeTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        typeTextField.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2-50).isActive = true
        
        statusLabel.topAnchor.constraint(equalTo: yearTextField.bottomAnchor, constant: 30).isActive = true
        statusLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        statusLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 20).isActive = true
        
        searchButton.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 30).isActive = true
        searchButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        searchButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        searchButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        setNeedsUpdateConstraints()
    }
}

