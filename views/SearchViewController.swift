//
//  SearchViewController.swift
//  views
//
//  Created by Kanat on 30.09.17.
//  Copyright © 2017 Kanat. All rights reserved.
//

import UIKit
import Alamofire

class SearchViewController: UIViewController {
    
    let searchLabel: UITextField = {
        let search = UITextField()
        search.backgroundColor = .white
        search.layer.borderWidth = 0.1
        search.layer.shadowRadius = 1
        search.layer.shadowColor = UIColor.black.cgColor
        search.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        search.layer.shadowOpacity = 1.0
        search.layer.borderColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 1).cgColor
        search.autocapitalizationType = UITextAutocapitalizationType.none
        search.layer.cornerRadius = 25
        search.layer.masksToBounds = true
        search.translatesAutoresizingMaskIntoConstraints = false
        return search
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
        navigationController?.navigationBar.barTintColor = UIColor.black
        let logo = UIImage(named: "logo.png")
        let imageView = UIImageView(image: logo)
        navigationItem.titleView = imageView
        
        view.addSubview(searchLabel)
        
        setupSearchLabel()
    }
    
    func setupSearchLabel(){
        searchLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        searchLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -25).isActive = true
        searchLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -50).isActive = true
        searchLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    



}
