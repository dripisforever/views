//
//  ViewController.swift
//  views
//
//  Created by Kanat on 28.09.17.
//  Copyright © 2017 Kanat. All rights reserved.
//


import UIKit
import Alamofire

class ViewController: UIViewController {
    
    let emailLabel: UITextField = {
        let email = UITextField()
        email.backgroundColor = .white
        email.autocapitalizationType = UITextAutocapitalizationType.none
        email.layer.cornerRadius = 5
        email.layer.masksToBounds = true
        email.placeholder = "Enter your email"
        email.translatesAutoresizingMaskIntoConstraints = false
        return email
    }()
    
    let usernameLabel: UITextField = {
        let username = UITextField()
        username.backgroundColor = .white
        username.autocapitalizationType = UITextAutocapitalizationType.none
        username.layer.cornerRadius = 5
        username.layer.masksToBounds = true
        username.placeholder = "Enter your login"
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
    
    let signUpButton: UIButton = {
        let signUp = UIButton()
        signUp.backgroundColor = .green
        signUp.setTitle("Sign up", for: .normal)
        signUp.layer.cornerRadius = 5
        signUp.layer.masksToBounds = true
        signUp.translatesAutoresizingMaskIntoConstraints = false
        signUp.addTarget(self, action: #selector( handleAction), for: .touchUpInside)
        return signUp
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 61/255, green: 126/255, blue: 255/255, alpha: 1)
        view.addSubview(emailLabel)
        view.addSubview(passwordLabel)
        view.addSubview(usernameLabel)
        view.addSubview(signUpButton)
        setupEmailLabel()
        setupPasswordLabel()
        setupUsernameLabel()
        setupSignUpButton()
    }
    
    func setupEmailLabel() {
        emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50).isActive = true
        emailLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100).isActive = true
        emailLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
    }
    
    func setupUsernameLabel() {
        usernameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        usernameLabel.centerYAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 50).isActive = true
        usernameLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100).isActive = true
        usernameLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
    }
    
    func setupPasswordLabel() {
        passwordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordLabel.centerYAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 50).isActive = true
        passwordLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100).isActive = true
        passwordLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
    }

    func setupSignUpButton() {
        signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signUpButton.centerYAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 50).isActive = true
        signUpButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100).isActive = true
        signUpButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc func handleAction() {
        let username = usernameLabel.text
        let email = emailLabel.text
        let password = passwordLabel.text
        let parameters = [
            "username" : username,
            "email" : email,
            "password" : password
        ]
        let url = "https://views-api.herokuapp.com/api/users/signup"
        Alamofire.request(url, method:.post, parameters:parameters, encoding: JSONEncoding.default).responseJSON { response in
            switch response.result {
            case .success:
                print(response)
                self.handleSignup()
            case .failure(let error):
                print(0,"Error")
            }
        }
    }
    
    func handleSignup() {
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
    }

 
}



