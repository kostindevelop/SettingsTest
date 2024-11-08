//
//  SettingsModel.swift
//  SettingsApp
//
//  Created by Konstantin Antonyuk on 08.11.2024.
//

import Foundation

protocol SettingsModelNavigationHandler {
    func settingsModelNotificationSettingsAction(_ model: SettingsModel)
    func settingsModelChangeLanguageAction(_ model: SettingsModel)
    func settingsModelSubscriptionAction(_ model: SettingsModel)
    func settingsModelChangePasswordAction(_ model: SettingsModel)
    func settingsModelResetAllDataAction(_ model: SettingsModel)
    func settingsModelDeleteAccountAction(_ model: SettingsModel)
    func settingsModelLogoutAction(_ model: SettingsModel)
}

protocol SettingsModelProtocol: AnyObject {
    func actionHandler(_ action: SettingsActionType)
}

typealias SettingsActionType = SettingsModel.ActionType

final class SettingsModel: SettingsModelProtocol {
    
    enum ActionType {
        case notificationSettings
        case changeLanguage
        case subscription
        case changePassword
        case resetAllData
        case deleteAccount
        case logout
    }
    
    private let navigationHandler: SettingsModelNavigationHandler
    
    init(navigationHandler: SettingsModelNavigationHandler) {
        self.navigationHandler = navigationHandler
    }
    
    func actionHandler(_ action: ActionType) {
        // switch action реализовал тут в случае если прийдется обработать какой то запрос или логику
        switch action {
        case .notificationSettings:
            navigationHandler.settingsModelNotificationSettingsAction(self)
        case .changeLanguage:
            navigationHandler.settingsModelChangeLanguageAction(self)
        case .subscription:
            navigationHandler.settingsModelSubscriptionAction(self)
        case .changePassword:
            navigationHandler.settingsModelChangePasswordAction(self)
        case .resetAllData:
            navigationHandler.settingsModelResetAllDataAction(self)
        case .deleteAccount:
            navigationHandler.settingsModelDeleteAccountAction(self)
        case .logout:
            navigationHandler.settingsModelLogoutAction(self)
        }
    }
}
