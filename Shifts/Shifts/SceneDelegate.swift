//
//  SceneDelegate.swift
//  Shifts
//
//  Created by Abraham Abreu on 22/11/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    // MARK: - Main Window
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let mainViewController = MainViewController(nibName: Constants.ViewControllers.MainController, bundle: Bundle.main)
        let navigationController = UINavigationController(rootViewController: mainViewController)
        navigationController.navigationBar.prefersLargeTitles = false
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        guard let _ = (scene as? UIWindowScene) else { return }
    }
}

