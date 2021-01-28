//
//  ViewController.swift
//  PswrdStore
//
//  Created by an.chernyshev on 23/01/2021.
//  Copyright © 2021 a.dm.chernyshev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let identifier = "cell"
    private let search: UISearchController = UISearchController(searchResultsController: nil)
    private let button: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: nil)
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(TableViewCell.self, forCellReuseIdentifier: identifier)
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        initTableView()
        initNavigationBar()
    }
    
    func initNavigationBar() {
        button.target = self
        button.action = #selector(addNewPassword)
        
        self.navigationController?.navigationBar.topItem?.rightBarButtonItem = button
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.topItem?.title = "Passwords"
        self.navigationController?.navigationBar.topItem?.searchController = search
    }
    
    func initTableView() {
        view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
    }
    
    @objc func addNewPassword() {
        let vc = AddNewPasswordViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? TableViewCell {
            cell.textLabel?.text = "test"
            
            return cell
        }
        return UITableViewCell()
    }
    
}
