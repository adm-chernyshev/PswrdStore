//
//  PasscodeViewController.swift
//  PswrdStore
//
//  Created by an.chernyshev on 23/01/2021.
//  Copyright © 2021 a.dm.chernyshev. All rights reserved.
//

import UIKit
import LocalAuthentication

class PasscodeViewController: UIViewController {
    
    let context = LAContext()
    let presentVC = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        initFirstButton()
        initLabel()
//          removeBorder()
    }
    
    func initLabel() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        label.backgroundColor = .white
        label.text = "Password store is locked"
        label.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        label.numberOfLines = 3
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 275).isActive = true
        label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
    }
    
    func initFirstButton() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Use Touch ID", for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        view.addSubview(button)
        
        button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -300).isActive = true
        button.topAnchor.constraint(equalTo: view.topAnchor, constant: 300).isActive = true
        
        button.addTarget(self, action: #selector(useBiometricData), for: .touchUpInside)
        
        useBiometricData()
    }
    
    func removeBorder() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()
    }
    
    @objc func useBiometricData() {
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Please authenticate") { (success, error) in
                if success {
                    DispatchQueue.main.async {
                        self.dismiss(animated: true, completion: nil)
                        self.presentVC.modalPresentationStyle = .fullScreen
                        // self.present(self.presentVC, animated: true, completion: nil)
                    }
                } else {
                    guard let error = error else { return }
                    print(error.localizedDescription)
                }
            }
        }
    }
    
}
