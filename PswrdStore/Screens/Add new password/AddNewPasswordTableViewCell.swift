//
//  AddNewPasswordTableViewCell.swift
//  PswrdStore
//
//  Created by an.chernyshev on 28/01/2021.
//  Copyright © 2021 a.dm.chernyshev. All rights reserved.
//

import UIKit

class AddNewPasswordTableViewCell: UITableViewCell {
    
    lazy var textField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.clearButtonMode = .whileEditing
        
        return textField
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureTextField() {
        contentView.addSubview(textField)
        
        textField.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15).isActive = true
        textField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        textField.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15).isActive = true
        textField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
    }

}
