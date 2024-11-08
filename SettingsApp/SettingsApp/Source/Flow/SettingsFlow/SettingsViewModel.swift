//
//  SettingsViewModel.swift
//  SettingsApp
//
//  Created by Konstantin Antonyuk on 08.11.2024.
//

import Foundation

struct Section {
    
    enum SectionType {
        case profile
        case preferences
        case subscription
        case account
    }
    
    let title: String
    let type: SectionType
    let cellViewModels: [SettingsCellViewModel]
}

protocol SettingsViewModelProtocol {
    
    var sections: [Section] { get }
}

final class SettingsViewModel: SettingsViewModelProtocol {
    
    private(set) var sections: [Section] = []
    
    private let model: SettingsModelProtocol
    
    init(model: SettingsModelProtocol) {
        self.model = model
        
        createSections()
    }
}

private extension SettingsViewModel {
    
    func createSections() {
        sections = [
            profileSection(),
            preferencesSection(),
            subscriptionsSection(),
            accountSection()
        ]
    }
    
    func profileSection() -> Section {
        .init(
            title: "Profile",
            type: .profile,
            cellViewModels: [
                .init(leftIcon: .icProfile, titleText: "Name", subtitleText: "Robert Fox", rightIcon: nil, onSelect: {}),
                .init(leftIcon: .icEmail, titleText: "Email", subtitleText: "kostindevelop@gmail.com", rightIcon: nil, onSelect: {})
            ]
        )
    }
    
    func preferencesSection() -> Section {
        .init(
            title: "Preferences",
            type: .preferences,
            cellViewModels: [
                .init(leftIcon: .icNotification, titleText: "Notfication settings", subtitleText: nil, rightIcon: .init(named: "ic_chevron"), onSelect: { [weak model] in
                    model?.actionHandler(.notificationSettings)
                }),
                .init(leftIcon: .icLanguage, titleText: "Language", subtitleText: "English", rightIcon: .init(named: "ic_chevron"), onSelect: { [weak model] in
                    model?.actionHandler(.changeLanguage)
                })
            ]
        )
    }
    
    func subscriptionsSection() -> Section {
        .init(
            title: "Subscription",
            type: .subscription,
            cellViewModels: [
                .init(leftIcon: .icSubscription, titleText: "Subscription", subtitleText: "Not purchased", rightIcon: .init(named: "ic_chevron"), onSelect: { [weak model] in
                    model?.actionHandler(.subscription)
                }),
            ]
        )
    }
    
    func accountSection() -> Section {
        .init(
            title: "Account",
            type: .account,
            cellViewModels: [
                .init(leftIcon: .icPassword, titleText: "Change password", subtitleText: nil, rightIcon: nil, onSelect: { [weak model] in
                    model?.actionHandler(.changePassword)
                }),
                .init(leftIcon: .icResetData, titleText: "Reset all data", subtitleText: nil, rightIcon: nil, onSelect: { [weak model] in
                    model?.actionHandler(.resetAllData)
                }),
                .init(leftIcon: .icDeleteAccount, titleText: "Delete account", subtitleText: nil, rightIcon: nil, onSelect: { [weak model] in
                    model?.actionHandler(.deleteAccount)
                }),
                .init(leftIcon: .icLogout, titleText: "Log Out", subtitleText: nil, rightIcon: nil, onSelect: { [weak model] in
                    model?.actionHandler(.logout)
                })
            ]
        )
    }
}
