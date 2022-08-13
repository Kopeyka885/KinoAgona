//
//  CustomTextField.swift
//  Kinoagona
//
//  Created by Камиль Кадыров on 11.08.2022.
//

import UIKit

class CustomTextField: UIView {

    public let textField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.textAlignment = .center
        textField.clearButtonMode = .always
        return textField
    }()
    
    private let bottomBorder: UIView = {
        let lineView = UIView()
        lineView.layer.borderWidth = 2
        lineView.layer.borderColor = UIColor.lightGray.cgColor
        return lineView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(textField)
        addSubview(bottomBorder)
        
        
        textField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        bottomBorder.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(1)
            make.width.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
