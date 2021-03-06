//
//  SceneDelegate.swift
//  PswrdStore
//
//  Created by an.chernyshev on 23/01/2021.
//  Copyright © 2021 a.dm.chernyshev. All rights reserved.
//

import UIKit
import LocalAuthentication

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let mainVC = ViewController()
        let tabbar = TabBarController()
        let settingsVC = SettingsViewController()
        let settingsNavigationVC = SettingsNavigationViewController(rootViewController: settingsVC)
        let navigation = NavigationViewController(rootViewController: mainVC)
        
        navigation.tabBarItem = UITabBarItem(title: "Passwords", image: UIImage(named: "maintab"), tag: 0)
        settingsNavigationVC.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(named: "settings"), tag: 1)

        tabbar.viewControllers = [navigation, settingsNavigationVC]
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = tabbar
        window?.makeKeyAndVisible()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        let biometry = PasscodeViewController()
        biometry.modalPresentationStyle = .overFullScreen
        self.window?.rootViewController?.present(biometry, animated: true, completion: nil)
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
        
        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
    
    
}

