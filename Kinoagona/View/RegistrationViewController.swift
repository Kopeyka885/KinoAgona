//
//  RegistrationViewController.swift
//  Kinoagona
//
//  Created by Камиль Кадыров on 10.08.2022.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    var base = AuthorizationRegistrationBaseViewController()
    var confirmPasswordTextField: CustomTextField!
    var loader = UIImageView(image: UIImage(named:"LoaderSpinner"))

    override func viewDidLoad() {
        super.viewDidLoad()
        print("We are at registration!")
        initialize()
        
    }
    
    func initialize() {
        view.addSubview(base.view)
        initializeViews()
        initializeConstraints()
        
    }
    
    func initializeViews() {
        loader.isHidden = true
        base.view.addSubview(loader)
        confirmPasswordTextField = CustomTextField()
        confirmPasswordTextField.textField.placeholder = "Подтвердите пароль"
        confirmPasswordTextField.textField.textAlignment = .center
        confirmPasswordTextField.textField.isSecureTextEntry = true
        base.view.addSubview(confirmPasswordTextField)
        
        base.warningLabel.text = "Пароли не совпадают"
        
        base.mainButton.setTitle("Регистрация", for: .normal)
        base.mainButton.addTarget(self, action: #selector(mainButtonPressed), for: .touchUpInside)
        
        base.emailTextField.textField.delegate = self
        base.passwordTextField.textField.delegate = self
        confirmPasswordTextField.textField.delegate = self
        
    }
    
    func initializeConstraints(){
        base.emailTextField.snp.updateConstraints { make in
            make.top.equalTo(base.appLogo.snp.bottom).offset(120)
        }
        confirmPasswordTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(base.passwordTextField.snp.width)
            make.top.equalTo(base.passwordTextField.snp.bottom)
            make.height.equalTo(base.passwordTextField.snp.height)
        }
        base.warningLabel.snp.remakeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.top.equalTo(confirmPasswordTextField.snp.bottom).offset(20)
        }
        base.mainButton.snp.remakeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.4)
            make.height.equalTo(50)
            make.top.equalTo(confirmPasswordTextField.snp.bottom).offset(100)
        }
        loader.snp.makeConstraints { make in
            make.width.equalTo(35)
            make.height.equalTo(35)
            make.centerX.equalToSuperview()
            make.top.equalTo(confirmPasswordTextField.snp.bottom).offset(100)
        }
        
    }
    
    @objc func mainButtonPressed() {
        if (base.passwordTextField.textField.text != confirmPasswordTextField.textField.text){
            base.warningLabel.isHidden = false
            base.passwordTextField.textField.textColor = .red
            confirmPasswordTextField.textField.textColor = .red
        } else {
            base.mainButton.isHidden = true
            loader.isHidden = false
            loading()
            let _ = Timer.scheduledTimer(timeInterval: 1.9, target: self, selector: #selector(loading), userInfo: nil, repeats: true)
        }
        
    }
    
    @objc func loading(){
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn) {
            let angle = CGFloat.pi / 2
            self.loader.transform = CGAffineTransform(rotationAngle: angle)
        } completion: { _ in
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear) {
                let angle = CGFloat.pi
                self.loader.transform = CGAffineTransform(rotationAngle: angle)
            } completion: { _ in
                UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear) {
                    let angle = CGFloat.pi * 3 / 2
                    self.loader.transform = CGAffineTransform(rotationAngle: angle)
                } completion: { _ in
                    UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut) {
                        let angle = CGFloat.pi * 2
                        self.loader.transform = CGAffineTransform(rotationAngle: angle)
                    }
                }
            }
        }
        
    }
}


extension RegistrationViewController: UITextFieldDelegate{
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        base.warningLabel.isHidden = true
        base.passwordTextField.textField.textColor = .black
        confirmPasswordTextField.textField.textColor = .black
        
        if (base.emailTextField.textField.hasText && base.passwordTextField.textField.hasText && confirmPasswordTextField.textField.hasText){
            
            base.mainButton.layer.borderColor = UIColor(named: "AgonaBlue")?.cgColor
            base.mainButton.backgroundColor = .white
            base.mainButton.isEnabled = true
        } else {
            base.mainButton.layer.borderColor = UIColor(named: "LightGray")?.cgColor
            base.mainButton.backgroundColor = UIColor(named: "LightGray")
            base.mainButton.isEnabled = false
        }
        
    }

}

