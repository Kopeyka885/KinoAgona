//
//  AuthorizationRegistrationBaseViewController.swift
//  Kinoagona
//
//  Created by Камиль Кадыров on 13.08.2022.
//

import UIKit
import SnapKit

class AuthorizationRegistrationBaseViewController: UIViewController {
    
    var appLogo: UIImageView!
    var mainButton: UIButton!
    var emailTextField: CustomTextField!
    var passwordTextField: CustomTextField!
    var warningLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeViews()
        initializeConstraints()
        
    }
    
    func initializeViews(){
        view.backgroundColor = .white
        
        appLogo = UIImageView(image: UIImage(named: "AppLogoFull"))
        view.addSubview(appLogo)
        
        emailTextField = CustomTextField()
        emailTextField.textField.placeholder = "Адрес электронной почты"
        view.addSubview(emailTextField)
        
        
        passwordTextField = CustomTextField()
        passwordTextField.textField.placeholder = "Пароль"
        passwordTextField.textField.isSecureTextEntry = true
        view.addSubview(passwordTextField)
        
        warningLabel = UILabel()
        warningLabel.textColor = .red
        warningLabel.isHidden = true
        warningLabel.font = UIFont.systemFont(ofSize: 13)
        warningLabel.textAlignment = .center
        view.addSubview(warningLabel)
        
        mainButton = UIButton()
        mainButton.setTitleColor(UIColor(named: "AgonaBlue"), for: .normal)
        mainButton.setTitleColor(UIColor(named: "DarkGray"), for: .disabled)
        mainButton.backgroundColor = UIColor(named: "LightGray")
        mainButton.layer.cornerRadius = 25
        mainButton.layer.borderWidth = 3
        mainButton.layer.borderColor = UIColor(named: "LightGray")?.cgColor
        mainButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        mainButton.isEnabled = false
        view.addSubview(mainButton)
        
    }
        
        func initializeConstraints(){
            appLogo.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.width.equalToSuperview().multipliedBy(0.26)
                make.height.equalTo(appLogo.snp.width).multipliedBy(0.43)
                make.top.equalToSuperview().offset(200)
            }
            emailTextField.snp.makeConstraints { make in
                make.leading.trailing.equalToSuperview().inset(20)
                make.height.equalTo(60)
                make.top.equalTo(appLogo.snp.bottom).offset(150)
            }
            passwordTextField.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.width.equalToSuperview().inset(20)
                make.height.equalTo(60)
                make.top.equalTo(emailTextField.snp.bottom)
            }
            warningLabel.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.width.equalToSuperview()
                make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            }
            mainButton.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.width.equalToSuperview().multipliedBy(0.4)
                make.height.equalTo(50)
                make.top.equalTo(passwordTextField.snp.bottom).offset(100)
            }
        }
    
    }
