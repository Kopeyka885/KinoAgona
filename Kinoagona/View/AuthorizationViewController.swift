//
//  AuthorizationViewController.swift
//  Kinoagona
//
//  Created by Камиль Кадыров on 07.08.2022.
//

import UIKit
import SnapKit


class AuthorizationViewController: UIViewController {
    
    var base = AuthorizationRegistrationBaseViewController()
    var stackView: UIStackView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(base.view)
        initializeViews()
        initializeConstraints()
    }
    
    func initializeViews(){
        base.emailTextField.textField.delegate = self
        
        base.passwordTextField.textField.delegate = self
        
        base.warningLabel.text = "Неверный логин или пароль"
        
        base.mainButton.setTitle("Войти", for: .normal)
        base.mainButton.addTarget(self, action: #selector(mainButtonPressed), for: .touchUpInside)
        
        let registrationLabel = UILabel()
        registrationLabel.text = "Еще не зарегестрированы? "
        registrationLabel.font = UIFont.systemFont(ofSize: 16)
        registrationLabel.textColor = .gray
        registrationLabel.textAlignment = .right
        
        let registrationLink = UIButton()
        registrationLink.setTitle(" Регистрация", for: .normal)
        registrationLink.setTitleColor(UIColor(named: "AgonaBlue"), for: .normal)
        registrationLink.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        registrationLink.contentHorizontalAlignment = .left
        registrationLink.addTarget(self, action: #selector(registrationLinkPressed), for: .touchUpInside)
        
        stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillProportionally
        
        stackView.addArrangedSubview(registrationLabel)
        stackView.addArrangedSubview(registrationLink)
        view.addSubview(stackView)
    }
    
    func initializeConstraints(){
        stackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(base.mainButton.snp.bottom).offset(50)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(50)
        }
    }
    
    @objc func mainButtonPressed(){
        let email = "test"
        let password = email
        if (base.emailTextField.textField.text == email && base.passwordTextField.textField.text == password){
            print("Вы авторизованы, сэр")
        } else {
            base.warningLabel.isHidden = false
            base.passwordTextField.textField.textColor = .red
            base.emailTextField.textField.textColor = .red
        }
    }
    
    @objc func registrationLinkPressed(){
        let regVC = RegistrationViewController()
        navigationController?.pushViewController(regVC, animated: true)
    }

}


extension AuthorizationViewController: UITextFieldDelegate{
    func textFieldDidChangeSelection(_ textField: UITextField) {
        base.warningLabel.isHidden = true
        base.passwordTextField.textField.textColor = .black
        base.emailTextField.textField.textColor = .black
        if (base.emailTextField.textField.hasText && base.passwordTextField.textField.hasText){
            base.mainButton.layer.borderColor = UIColor(named: "AgonaBlue")?.cgColor
            base.mainButton.backgroundColor = .white
            base.mainButton.isEnabled = true
        } else {
            base.mainButton.layer.borderColor = UIColor(named: "LightGray")?.cgColor
//            mainButton.layer.borderColor = UIColor.white.cgColor
            base.mainButton.backgroundColor = UIColor(named: "LightGray")
            base.mainButton.isEnabled = false
        }
    }
    
    
}
