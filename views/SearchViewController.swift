//
//  SearchViewController.swift
//  views
//
//  Created by Kanat on 30.09.17.
//  Copyright © 2017 Kanat. All rights reserved.

<<<<<<< HEAD

import UIKit
import Alamofire
import SnapKit
import SwiftyJSON
=======
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
>>>>>>> 0f4b2d8f339eb2cc9c5e49854f891ab55647018c

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let cellId = "CellId"
    var sites: [Sites] = []{
        didSet {
            searchTableView.reloadData()
        }
    }
    let menuItems = ["Категории", "Акции и скидки", "Мои заказы", "Избранные Магазины", "Настройки", "Оставить отзыв", "О нас"]
    
    lazy var searchTableView: UITableView = {
        let tableView = UITableView()
        tableView.layer.cornerRadius = 10
        tableView.isScrollEnabled = false
        tableView.separatorStyle = .none
        return tableView
    }()
    
    let searchLabel: UITextField = {
        let search = UITextField()
        search.leftView = UIImageView(image: UIImage(named: "surf"))
        search.leftViewMode = .always
        search.backgroundColor = .white
        search.layer.borderWidth = 0.1
        search.layer.shadowRadius = 1
        search.layer.shadowColor = UIColor.black.cgColor
        search.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        search.layer.shadowOpacity = 1.0
        search.layer.borderColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 1).cgColor
        search.autocapitalizationType = UITextAutocapitalizationType.none
        search.layer.cornerRadius = 25
        search.addTarget(self, action: #selector(searchOnType), for: .editingChanged)
        search.layer.masksToBounds = true
        search.translatesAutoresizingMaskIntoConstraints = false
        return search
    }()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
<<<<<<< HEAD
        searchTableView.dataSource = self
        searchTableView.delegate = self
        searchTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        view.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
        setupNavigationBar()
        setupViews()
    }
    
    private func setupNavigationBar(){
        navigationController?.navigationBar.barTintColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.9)
        
        
        let logo = UIImageView(frame: CGRect(x: 0, y: 0, width: 0, height: 20))
        logo.image = UIImage(named: "logo.png")
        logo.contentMode = .scaleAspectFit
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        titleLabel.attributedText = NSMutableAttributedString(string: "VIEWS", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 30), NSAttributedStringKey.foregroundColor: UIColor.white])
        navigationItem.titleView = titleLabel
    }
    
    @objc func searchOnType() {
        let query = searchLabel.text
        
        let url = "https://views-api.herokuapp.com/api/users/search?q=\(query!)"
        print(url)
        Alamofire.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                self.sites = []
                for site in json["users"].arrayValue{
                    let id = site["id"].stringValue
                    let name = site["username"].stringValue
                    let site = Sites(user_id: id, user_name: name)
                    print(name)
                    self.sites.append(site)
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
//    func textFieldDidBeginEditing(searchLabel: UITextField){
//        animateViewMoving(up: true, moveValue: 250)
//    }
    
//    func animateViewMoving (up:Bool, moveValue :CGFloat){
//        var movementDuration: TimeInterval = 0.3
//        var movement:CGFloat = ( up ? -moveValue : moveValue)
//        UIView.beginAnimations( "animateView", context: nil)
//        UIView.setAnimationBeginsFromCurrentState(true)
//        UIView.setAnimationDuration(movementDuration)
//        UIView.commitAnimations()
//    }
    
    func setupViews(){
        view.addSubview(searchLabel)
        searchLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(view.snp.top).offset(300)
            make.width.equalTo(view.snp.width).inset(35)
            make.height.equalTo(50)
        }
        view.addSubview(searchTableView)
        searchTableView.snp.makeConstraints { (make) in
            make.centerX.equalTo(view.snp.centerX)
            make.width.equalTo(view.snp.width).inset(35)
            make.top.equalTo(searchLabel.snp.bottom).offset(30)
            make.height.equalTo(223)
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let site = sites[indexPath.row]
        cell.backgroundColor = .white
        cell.textLabel?.text = site.user_name
        cell.textLabel?.textColor = .black
        return cell
    }
=======
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
    

>>>>>>> 0f4b2d8f339eb2cc9c5e49854f891ab55647018c


}












