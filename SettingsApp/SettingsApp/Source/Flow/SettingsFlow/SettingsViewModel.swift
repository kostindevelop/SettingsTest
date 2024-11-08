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
            title: AppStrings.Settings.sectionTitleProfile,
            type: .profile,
            cellViewModels: [
                .init(leftIcon: .icProfile, titleText: AppStrings.Settings.name, subtitleText: "Robert Fox"),
                .init(leftIcon: .icEmail, titleText: AppStrings.Settings.email, subtitleText: "kostindevelop@gmail.com")
            ]
        )
    }
    
    func preferencesSection() -> Section {
        .init(
            title: AppStrings.Settings.sectionTitlePreferences,
            type: .preferences,
            cellViewModels: [
                .init(leftIcon: .icNotification, titleText: AppStrings.Settings.notificationSettings, rightIcon: .init(named: "ic_chevron"), onSelect: { [weak model] in
                    model?.actionHandler(.notificationSettings)
                }),
                .init(leftIcon: .icLanguage, titleText: AppStrings.Settings.language, subtitleText: "English", rightIcon: .init(named: "ic_chevron"), onSelect: { [weak model] in
                    model?.actionHandler(.changeLanguage)
                })
            ]
        )
    }
    
    func subscriptionsSection() -> Section {
        .init(
            title: AppStrings.Settings.sectionTitleSubscription,
            type: .subscription,
            cellViewModels: [
                .init(leftIcon: .icSubscription, titleText: AppStrings.Settings.subscription, subtitleText: "Not purchased purchased purchased", rightIcon: .init(named: "ic_chevron"), onSelect: { [weak model] in
                    model?.actionHandler(.subscription)
                }),
            ]
        )
    }
    
    func accountSection() -> Section {
        .init(
            title: AppStrings.Settings.sectionTitleAccount,
            type: .account,
            cellViewModels: [
                .init(leftIcon: .icPassword, titleText: AppStrings.Settings.changePassword, onSelect: { [weak model] in
                    model?.actionHandler(.changePassword)
                }),
                .init(leftIcon: .icResetData, titleText: AppStrings.Settings.resetAllData, onSelect: { [weak model] in
                    model?.actionHandler(.resetAllData)
                }),
                .init(leftIcon: .icDeleteAccount, titleText: AppStrings.Settings.deleteAccount, onSelect: { [weak model] in
                    model?.actionHandler(.deleteAccount)
                }),
                .init(leftIcon: .icLogout, titleText: AppStrings.Settings.logout, onSelect: { [weak model] in
                    model?.actionHandler(.logout)
                })
            ]
        )
    }
}
