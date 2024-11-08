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
    private var navigationController: UINavigationController?
    
    init() {
        appDelegate = UIApplication.shared.delegate as? AppDelegate
    }
    
    func start() {
        navigationController = UINavigationController()
        appDelegate?.window = UIWindow(frame: UIScreen.main.bounds)
        appDelegate?.window?.rootViewController = navigationController
        appDelegate?.window?.makeKeyAndVisible()
        
        let settingsCoordinator = SettingsCoordinator(navigationController: navigationController!, navigationHandler: self)
        settingsCoordinator.start()
    }
}

// MARK: - SettingsCoordinatorNavigationHandler
extension AppCoordinator: SettingsCoordinatorNavigationHandler {
    func settingsCoordinatorPresentLogout(_ coordinator: SettingsCoordinator) {
        showAlertLogout()
    }
}

// MARK: - Private methods
private extension AppCoordinator {
    func showAlertLogout() {
        let alert = UIAlertController(title: "Ooooh", message: "We're sorry you're leaving...", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Confirm", style: .destructive, handler: nil))
        navigationController?.present(alert, animated: true, completion: nil)
    }
}
