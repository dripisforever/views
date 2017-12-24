//
//  LoginController.swift
//  views
//
//  Created by Kanat on 29.09.17.
//  Copyright © 2017 Kanat. All rights reserved.
//

import UIKit
import Alamofire
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
        signIn.setTitle("Sign in", for: .normal)
        signIn.layer.cornerRadius = 5
        signIn.layer.masksToBounds = true
        signIn.translatesAutoresizingMaskIntoConstraints = false
        signIn.addTarget(self, action: #selector(handleAction), for: .touchUpInside)
        return signIn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    }


}
