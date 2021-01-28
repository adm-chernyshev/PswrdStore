//
//  SettingsTableViewCell.swift
//  PswrdStore
//
//  Created by an.chernyshev on 28/01/2021.
//  Copyright © 2021 a.dm.chernyshev. All rights reserved.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
    
    lazy var switcher: UISwitch = {
        let switcher = UISwitch(frame: .zero)
        switcher.translatesAutoresizingMaskIntoConstraints = false
        
        return switcher
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureSwitcher()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureSwitcher() {
        contentView.addSubview(switcher)
        
        switcher.isHidden = true
        switcher.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        switcher.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        switcher.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
    }

}
