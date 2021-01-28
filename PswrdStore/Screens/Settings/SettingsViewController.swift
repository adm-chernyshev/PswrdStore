//
//  SettingsViewController.swift
//  PswrdStore
//
//  Created by an.chernyshev on 27/01/2021.
//  Copyright © 2021 a.dm.chernyshev. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let passcode = PasscodeViewController()
    private let identifier = "cell"
    private let settingsNames = ["Unlock with Face ID", "Autolock", "Lock", "Logout"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initNavigationBar()
        initTableView()
        
        view.backgroundColor = .white
        
    }
    
    func initNavigationBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.topItem?.title = "Settings"
    }
    
    func initTableView() {
        let tableView: UITableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: identifier)
        view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
    }

}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Security"
        }
        return ""
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 4
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? SettingsTableViewCell {
            cell.selectionStyle = .none
            cell.textLabel?.text = settingsNames[indexPath.row]
            
            if cell.textLabel?.text == "Unlock with Face ID" {
                cell.switcher.isHidden = false
            }
            
            if cell.textLabel?.text == "Logout" {
                cell.textLabel?.textColor = .systemRed
            }
            
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 2 {
            passcode.modalPresentationStyle = .fullScreen
            self.present(passcode, animated: true, completion: nil)
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
}
