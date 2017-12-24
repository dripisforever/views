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
    
//    let logoPlace: UIImageView = {
//        let logo = UIImageView()
//        logo.image = UIImage(named: "logo")
//        logo.contentMode = .scaleAspectFit
//        logo.translatesAutoresizingMaskIntoConstraints = false
//        return logo
//    }
    
    let emailLabel: UITextField = {
        let email = UITextField()
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 50))
        email.backgroundColor = UIColor(red: 27/255, green: 27/255, blue: 27/255, alpha: 1)
        email.autocapitalizationType = UITextAutocapitalizationType.none
        email.textColor = .white
        email.layer.cornerRadius = 5
        email.leftView = paddingView
        email.leftViewMode = .always
        email.layer.masksToBounds = true
        email.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        email.translatesAutoresizingMaskIntoConstraints = false
        return email
    }()
    
    let usernameLabel: UITextField = {
        let username = UITextField()
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 50))
        username.backgroundColor = UIColor(red: 27/255, green: 27/255, blue: 27/255, alpha: 1)
        username.autocapitalizationType = UITextAutocapitalizationType.none
        username.textColor = .white
        username.leftView = paddingView
        username.leftViewMode = .always
        username.layer.cornerRadius = 5
        username.layer.masksToBounds = true
        username.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        username.translatesAutoresizingMaskIntoConstraints = false
        return username
    }()
    
    let passwordLabel: UITextField = {
        let password = UITextField()
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 50))
        password.backgroundColor = UIColor(red: 27/255, green: 27/255, blue: 27/255, alpha: 1)
        password.autocapitalizationType = UITextAutocapitalizationType.none
        password.textColor = .white
        password.leftView = paddingView
        password.leftViewMode = .always
        password.isSecureTextEntry = true
        password.layer.cornerRadius = 5
        password.layer.masksToBounds = true
        password.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        password.translatesAutoresizingMaskIntoConstraints = false
        return password
    }()
    
    let signUpButton: UIButton = {
        let signUp = UIButton()
        signUp.backgroundColor = UIColor(red: 0/255, green: 162/255, blue: 5/255, alpha: 1)
        signUp.setTitle("Sign up", for: .normal)
        signUp.layer.cornerRadius = 5
        signUp.layer.masksToBounds = true
        signUp.translatesAutoresizingMaskIntoConstraints = false
        signUp.addTarget(self, action: #selector( handleAction), for: .touchUpInside)
        return signUp
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        view.addSubview(emailLabel)
        view.addSubview(passwordLabel)
        view.addSubview(usernameLabel)
        view.addSubview(signUpButton)
//        view.addSubview(logoPlace)
        setupEmailLabel()
        setupPasswordLabel()
        setupUsernameLabel()
        setupSignUpButton()
//        setupLogoPlace()
    }
//    func setupLogoPlace(){
//        logoPlace.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        logoPlace.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        logoPlace.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -150).isActive = true
//        logoPlace.heightAnchor.constraint(equalToConstant: 50).isActive = true
//    }
    func setupEmailLabel() {
        emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50).isActive = true
        emailLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100).isActive = true
        emailLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupUsernameLabel() {
        usernameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        usernameLabel.centerYAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 50).isActive = true
        usernameLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100).isActive = true
        usernameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupPasswordLabel() {
        passwordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordLabel.centerYAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 50).isActive = true
        passwordLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100).isActive = true
        passwordLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
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
        Alamofire.request(url, method:.post, parameters:parameters,encoding: JSONEncoding.default).responseJSON { response in
            switch response.result {
            case .success:
                print(response)
                self.handleSignup()
            case .failure(let error):
                print(0,"Error")
            }
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func handleSignup() {
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
    }
}



