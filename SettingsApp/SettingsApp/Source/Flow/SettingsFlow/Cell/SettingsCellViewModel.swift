//
//  SettingsCellViewModel.swift
//  SettingsApp
//
//  Created by Konstantin Antonyuk on 08.11.2024.
//

import UIKit

final class SettingsCellViewModel {
    
    let leftIcon: UIImage?
    let titleText: String
    let subtitleText: String?
    let rightIcon: UIImage?
    let onSelect: () -> Void
    
    init(
        leftIcon: UIImage?,
        titleText: String,
        subtitleText: String?,
        rightIcon: UIImage?,
        onSelect: @escaping () -> Void
    ) {
        self.leftIcon = leftIcon
        self.titleText = titleText
        self.subtitleText = subtitleText
        self.rightIcon = rightIcon
        self.onSelect = onSelect
    }
}
