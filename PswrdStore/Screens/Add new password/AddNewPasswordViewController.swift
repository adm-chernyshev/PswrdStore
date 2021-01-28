//
//  AddNewPasswordViewController.swift
//  PswrdStore
//
//  Created by an.chernyshev on 26/01/2021.
//  Copyright © 2021 a.dm.chernyshev. All rights reserved.
//

import UIKit

class AddNewPasswordViewController: UIViewController {
    
    private let fieldsName = ["Name", "Login", "Password", "Comment"]
    private let button = UIButton(type: .custom)
    private let identifier = "cell"
    
    lazy var customView: UIView = {
        let customView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 100))
        button.frame = .zero
        button.translatesAutoresizingMaskIntoConstraints = false
        
        customView.addSubview(button)
        
        return customView
    }()

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(AddNewPasswordTableViewCell.self, forCellReuseIdentifier: identifier)
        tableView.allowsSelection = false
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        self.navigationItem.largeTitleDisplayMode = .never
        initTableView()
        configureButton()
    }
    
    @objc func saveButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func initTableView() {
        view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
    }
    
    func configureButton() {
        button.setTitle("Save", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(saveButton), for: .touchUpInside)
        
        button.leftAnchor.constraint(equalTo: customView.leftAnchor, constant: 75).isActive = true
        button.topAnchor.constraint(equalTo: customView.topAnchor, constant: 50).isActive = true
        button.rightAnchor.constraint(equalTo: customView.rightAnchor, constant: -75).isActive = true
        button.bottomAnchor.constraint(equalTo: customView.bottomAnchor, constant: -5).isActive = true
    }
    
}

extension AddNewPasswordViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return customView
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Credentials"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? AddNewPasswordTableViewCell {
//            cell.textLabel?.text = fieldsName[indexPath.row]
            cell.textField.placeholder = fieldsName[indexPath.row]
            if cell.textField.placeholder == "Password" {
                cell.textField.isSecureTextEntry = true
            }
            
            return cell
        }
        
        return UITableViewCell()
    }
    
}
