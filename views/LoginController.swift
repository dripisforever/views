//
//  LoginController.swift
//  views
//
//  Created by Kanat on 29.09.17.
//  Copyright © 2017 Kanat. All rights reserved.
//

import UIKit
import Alamofire

class LoginController: UIViewController {

    let successLabel: UILabel = {
       let success = UILabel()
        success.textColor = .white
        success.textAlignment = .center
        success.text = "Successfully registered! Now you can log in"
        success.translatesAutoresizingMaskIntoConstraints = false
        return success
    }()
    
    let usernameLabel: UITextField = {
        let username = UITextField()
        username.backgroundColor = .white
        username.autocapitalizationType = UITextAutocapitalizationType.none
        username.layer.cornerRadius = 5
        username.layer.masksToBounds = true
        username.placeholder = "Enter login or e-mail"
        username.translatesAutoresizingMaskIntoConstraints = false
        return username
    }()
    
    let passwordLabel: UITextField = {
        let password = UITextField()
        password.backgroundColor = .white
        password.autocapitalizationType = UITextAutocapitalizationType.none
        password.layer.cornerRadius = 5
        password.layer.masksToBounds = true
        password.placeholder = "Enter your password"
        password.translatesAutoresizingMaskIntoConstraints = false
        return password
    }()
    
    let signInButton: UIButton = {
        let signIn = UIButton()
        signIn.backgroundColor = .green
        signIn.setTitle("Sign in", for: .normal)
        signIn.layer.cornerRadius = 5
        signIn.layer.masksToBounds = true
        signIn.translatesAutoresizingMaskIntoConstraints = false
        signIn.addTarget(self, action: #selector( handleAction), for: .touchUpInside)
        return signIn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 61/255, green: 126/255, blue: 255/255, alpha: 1)
        
        view.addSubview(successLabel)
        view.addSubview(usernameLabel)
        view.addSubview(passwordLabel)
        view.addSubview(signInButton)
        
        setupSuccessMessage()
        setupUsernameLabel()
        setupPasswordLabel()
        setupSignInButton()
    }
    
    func setupSuccessMessage() {
        successLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        successLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50).isActive = true
        successLabel.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        successLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
    }
    
    func setupUsernameLabel() {
        usernameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        usernameLabel.centerYAnchor.constraint(equalTo: successLabel.bottomAnchor, constant: 50).isActive = true
        usernameLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100).isActive = true
        usernameLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
    }
    
    func setupPasswordLabel() {
        passwordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordLabel.centerYAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 50).isActive = true
        passwordLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100).isActive = true
        passwordLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
    }
    
    func setupSignInButton() {
        signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signInButton.centerYAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 50).isActive = true
        signInButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100).isActive = true
        signInButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc func handleAction() {
        let username = usernameLabel.text
        let password = passwordLabel.text
        let parameters = [
            "username" : username,
            "password" : password
        ]
        let url = "https://views-api.herokuapp.com/api/users/signin"
        Alamofire.request(url, method:.post, parameters:parameters,encoding: JSONEncoding.default).responseJSON { response in
            switch response.result {
            case .success:
                print(response)
                self.handleSigin()
            case .failure(let error):
                print(0,"Error")
            }
        }
    }
    
    func handleSigin() {
        let mainController = MainController()
        present(mainController, animated: true, completion: nil)
    }


}
