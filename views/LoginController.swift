//
//  LoginController.swift
//  views
//
//  Created by Kanat on 29.09.17.
//  Copyright © 2017 Kanat. All rights reserved.
//

import UIKit
import Alamofire
<<<<<<< HEAD
import SnapKit

class LoginController: UIViewController {

    
    
    lazy var registerText: UILabel = {
       let label = UILabel()
        let text = NSMutableAttributedString(string: "Don't have an account?", attributes: [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.thin), NSAttributedStringKey.foregroundColor:UIColor.white])
        label.attributedText = text
        label.textAlignment = .center
        return label
    }()
    lazy var registerButton: UIButton = {
        let button = UIButton()
        let title = NSMutableAttributedString(string: "SignUp", attributes: [NSAttributedStringKey.font:UIFont.boldSystemFont(ofSize: 14), NSAttributedStringKey.foregroundColor:UIColor.white])
        button.setAttributedTitle(title, for: .normal)
        button.backgroundColor = nil
        button.addTarget(self, action: #selector(goToReg), for: .touchUpInside)
        return button
    }()
    
    lazy var registerView: UIView = {
        let regView = UIView()
        regView.addSubview(registerText)
        regView.addSubview(registerButton)
        return regView
    }()
    
    lazy var usernameLabel: UITextField = {
        let username = UITextField()
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 50))
        username.backgroundColor = UIColor(red: 27/255, green: 27/255, blue: 27/255, alpha: 1)
        username.autocapitalizationType = UITextAutocapitalizationType.none
        username.layer.cornerRadius = 5
        username.layer.masksToBounds = true
        username.leftView = paddingView
        username.leftViewMode = .always
        username.attributedPlaceholder = NSMutableAttributedString(string: "Username or Email", attributes: [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium), NSAttributedStringKey.foregroundColor:UIColor.white])
        username.keyboardType = .emailAddress
        username.textColor = .white
        username.translatesAutoresizingMaskIntoConstraints = false
        
        return username
    }()
    
    lazy var passwordLabel: UITextField = {
        let password = UITextField()
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 50))
        password.backgroundColor = UIColor(red: 27/255, green: 27/255, blue: 27/255, alpha: 1)
        password.autocapitalizationType = UITextAutocapitalizationType.none
        password.layer.cornerRadius = 5
        password.leftView = paddingView
        password.leftViewMode = .always
        password.attributedPlaceholder = NSMutableAttributedString(string: "Password", attributes: [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium), NSAttributedStringKey.foregroundColor:UIColor.white])
        password.isSecureTextEntry = true
        password.textColor = .white
        return password
    }()
    
    lazy var signInButton: UIButton = {
        let signIn = UIButton()
        signIn.backgroundColor = UIColor(red: 101/255, green: 0/255, blue: 185/255, alpha: 1)
=======

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
>>>>>>> 0f4b2d8f339eb2cc9c5e49854f891ab55647018c
        signIn.setTitle("Sign in", for: .normal)
        signIn.layer.cornerRadius = 5
        signIn.layer.masksToBounds = true
        signIn.translatesAutoresizingMaskIntoConstraints = false
<<<<<<< HEAD
        signIn.addTarget(self, action: #selector(handleAction), for: .touchUpInside)
=======
        signIn.addTarget(self, action: #selector( handleAction), for: .touchUpInside)
>>>>>>> 0f4b2d8f339eb2cc9c5e49854f891ab55647018c
        return signIn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
<<<<<<< HEAD
        view.backgroundColor = .black
        
        setupConstraints()
        
    }
    
    func setupConstraints(){
        view.addSubview(usernameLabel)
        view.addSubview(passwordLabel)
        view.addSubview(signInButton)
        view.addSubview(registerText)
        view.addSubview(registerButton)
        
        registerText.snp.makeConstraints { (make) in
            make.centerX.equalTo(view.snp.centerX)
            make.bottom.equalTo(view.snp.bottom).offset(-20)
        }
        registerButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(view.snp.centerX)
            make.bottom.equalTo(view.snp.bottom).offset(-20)
        }
        usernameLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(view.snp.centerX)
            make.width.equalTo(250)
            make.height.equalTo(50)
            make.top.equalTo(view.snp.top).offset(300)
        }
        passwordLabel.snp.makeConstraints { (make) in
            make.width.equalTo(250)
            make.height.equalTo(50)
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(usernameLabel.snp.bottom).offset(20)
        }
        signInButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(view.snp.centerX)
            make.width.equalTo(250)
            make.height.equalTo(50)
            make.top.equalTo(passwordLabel.snp.bottom).offset(20)
        }
        
    }
    
    
    @objc func goToReg(){
        let registrationController = ViewController()
        present(registrationController, animated: true, completion: nil)
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
        let mainController = TabBarController()
        present(mainController, animated: true, completion: nil)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
=======
        
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
>>>>>>> 0f4b2d8f339eb2cc9c5e49854f891ab55647018c
    }


}
