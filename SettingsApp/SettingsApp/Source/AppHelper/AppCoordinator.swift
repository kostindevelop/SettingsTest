//
//  AppCoordinator.swift
//  SettingsApp
//
//  Created by Konstantin Antonyuk on 08.11.2024.
//

import UIKit


final class AppCoordinator {
    
    private weak var appDelegate: AppDelegate?
    private var rootViewController: UIViewController?
    
    init() {
        appDelegate = UIApplication.shared.delegate as? AppDelegate
    }
    
    func start() {
        appDelegate?.window = UIWindow(frame: UIScreen.main.bounds)
        appDelegate?.window?.rootViewController = startController()
        appDelegate?.window?.makeKeyAndVisible()
    }
}

// MARK: - Private methods
private extension AppCoordinator {
    func startController() -> UIViewController {
        return settingsScreen()
    }
    
    func settingsScreen() -> UIViewController {
        let controller = UIViewController()
        controller.view.backgroundColor = .red
        return controller
    }
}

