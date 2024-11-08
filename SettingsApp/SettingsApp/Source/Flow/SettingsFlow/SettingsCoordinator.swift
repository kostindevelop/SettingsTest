//
//  SettingsCoordinator.swift
//  SettingsApp
//
//  Created by Konstantin Antonyuk on 08.11.2024.
//

import UIKit

protocol SettingsCoordinatorNavigationHandler: AnyObject {
    func settingsCoordinatorPresentLogout(_ coordinator: SettingsCoordinator)
}

final class SettingsCoordinator {
    
    private let navigationController: UINavigationController
    private weak var navigationHandler: SettingsCoordinatorNavigationHandler?

    init(navigationController: UINavigationController, navigationHandler: SettingsCoordinatorNavigationHandler?) {
        self.navigationController = navigationController
        self.navigationHandler = navigationHandler
    }

    func start() {
        let model = SettingsModel(navigationHandler: self)
        let viewModel = SettingsViewModel(model: model)
        let viewController = SettingsViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
}

// MARK: - SettingsModelNavigationHandler
extension SettingsCoordinator: SettingsModelNavigationHandler {
    func settingsModelNotificationSettingsAction(_ model: SettingsModel) {
        showAlert(message: "Notification")
    }
    
    func settingsModelChangeLanguageAction(_ model: SettingsModel) {
        showAlert(message: "Change language")
    }
    
    func settingsModelSubscriptionAction(_ model: SettingsModel) {
        showAlert(message: "Subscription")
    }
    
    func settingsModelChangePasswordAction(_ model: SettingsModel) {
        showAlert(message: "Change password")
    }
    
    func settingsModelResetAllDataAction(_ model: SettingsModel) {
        showAlert(message: "Reset all data")
    }
    
    func settingsModelDeleteAccountAction(_ model: SettingsModel) {
        showAlert(message: "Delete account")
    }
    
    func settingsModelLogoutAction(_ model: SettingsModel) {
        navigationHandler?.settingsCoordinatorPresentLogout(self)
    }
}

// MARK: - Private methods
private extension SettingsCoordinator {
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Good", message: "Did tap \(message)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        navigationController.present(alert, animated: true, completion: nil)
    }
}
